function [tempImage] = impaint2(image)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

SIZE_t = [9 25 49 81 121 169 255 289 361 441]; % Window size 
u_t = [7 8 9 10 12 14 16 18 20 22];          % percentage of useful pixels inside window 
lamda_t = [20 22 24 26 28 30 32 34 36 38];   % percentage of noise pixels inside window
maxDistance = 10;

%Global mean red 
globalmeanR = image(:,:,1); 
globalmeanR = uint8(mean(globalmeanR(:))); 

%Global mean green
globalmeanG = image(:,:,2); 
globalmeanG = uint8(mean(globalmeanG(:))); 

%Global mean blue 
globalmeanB = image(:,:,3); 
globalmeanB = uint8(mean(globalmeanB(:))); 

tempImage = image; 

for i = 1:size(image,1)
    for j = 1:size(image,2)
        if(image(i,j,1) == 0 && image(i, j, 2) == 0 && image(i, j, 3) == 0)
            %fprintf("%d %d \n", i , j);
            DIS = 1;
            while(true)  
                if(DIS <= size(SIZE_t,2))
                     length = sqrt(SIZE_t(DIS));
                    [window, u , lamda] = getWindow(image, i , j, length);
                end
                if(DIS > maxDistance)
                  
                   tempImage(i,j,1) = globalmeanR; 
                   tempImage(i,j,2) = globalmeanG; 
                   tempImage(i,j,3) = globalmeanB; 
                   break; 
                elseif(u ~= 0)   
                   if(u > u_t(DIS)) 
                        temp = window(:,:,1);
                        temp = temp(:);
                        m = sum(temp) ./ sum(temp~=0);
                        tempImage(i,j,1) = m;
                        
                        temp = window(:,:,2);
                        temp = temp(:);
                        m = sum(temp) ./ sum(temp~=0);
                        tempImage(i,j,2) = m;
                        
                        temp = window(:,:,3);
                        temp = temp(:);
                        m = sum(temp) ./ sum(temp~=0);
                        tempImage(i,j,3) = m;
                        break; 
                   else 
                       DIS = DIS + 1; 
                   end
                else
                    if(lamda > lamda_t(DIS))
                        DIS = DIS + 1; 
                    else 
                        tempImage(i,j,1) = globalmeanR; 
                        tempImage(i,j,2) = globalmeanG; 
                        tempImage(i,j,3) = globalmeanB;
                        break;
                    end
                    
                end
            
            end
            
        end
    end

end


end

