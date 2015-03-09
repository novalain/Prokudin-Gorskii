% Calculate the offset through NCC (Normalized cross correlation)
% img1 - base
% img2 - image to align

function output = ncc_offset(img1, img2, window, level)

    max = -inf; 
    
    for x = -level + window(1):level + window(1) % vertical displacement
        for y = -level + window(2):level + window(2) % horizontal displacement  
            
            tmp = circshift(img2, [x y]);
            ncc = dot(img1(:),tmp(:))/norm(img1(:))/norm(tmp(:));
            if ncc > max
                max = ncc;
                output = [x y];
            end
        end
    end
end