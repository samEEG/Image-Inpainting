function [ restoredImage] = impaint( image )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
d = []; 
SIZE = [9 25 49 81 121 169 255 289 361 441]; % Window size 
u_t = [7 8 9 10 12 14 16 18 20 22];          % percentage of useful pixels inside window 
lamda_t = [20 22 24 26 28 30 32 34 36 38];   % percentage of noise pixels inside window
%Global mean Red
globalmeanR = image(:,:,1); 
globalmeanR = uint8(mean(globalmeanR(:))); 

%Global mean green
globalmeanG = image(:,:,2); 
globalmeanG = uint8(mean(globalmeanG(:))); 

%Global mean blue 
globalmeanB = image(:,:,3); 
globalmeanB = uint8(mean(globalmeanB(:))); 
maxDistance = 10; 

for i  = 1:size(image, 1)
    for j = 1:size(image, 2)
        if(image(i,j,1) == 0 && image(i,j,2) == 0 && image(i,j,3) == 0)
            DIS = 1; 
            while(1)
               [window, u , lamda] = getWindow(image, i , j, sqrt(SIZE(DIS)));
               size(window)
               d = [d, DIS];
               if(DIS > maxDistance)
                   image(i,j,1) = globalmeanR;
                   image(i,j,2) = globalmeanG; 
                   image(i,j,3) = globalmeanB;
                   break; 
               elseif( u ~= 0)
                   % there exists useful surrounding pixels 
                    if ( u > u_t(DIS))
                        meanRed = window(:,:,1);
                        meanRed = uint8(mean(meanRed(:)));
                        image(i,j,1) = meanRed; 
                        
                        meanGreen = window(:,:,2);
                        meanGreen = uint8(mean(meanGreen(:)));
                        image(i,j,2) = meanGreen;                        
                       
                        meanBlue= window(:,:,3);
                        meanBlue = uint8(mean(meanBlue(:)));
                        image(i,j,3) = meanBlue;
                        break
                    else
                        DIS = DIS + 1; 
                    end
               else 
                   if(lamda > lamda_t(DIS))
                        DIS = DIS + 1; 
                   else 
                        image(i,j,1) = globalmeanR;
                        image(i,j,2) = globalmeanG; 
                        image(i,j,3) = globalmeanB;  
                        break;
                   end
               end
               
            end
            
        end
    end
end
restoredImage = image; 

end
