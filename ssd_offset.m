% Perform an exhaustive search over a window with possible displacements
% We take the Displacement that has the best matching score

% Find the minimum displacement between the channels
% img1 - base
% img2 - image to align
function output = ssd_offset(img1, img2, window, level)

    min = inf; % first value less than sum
    
    for x = -level + window(1):level + window(1) % vertical displacement
        for y = -level + window(2):level + window(2) % horizontal displacement  
           
            tmp = circshift(img2, [x y]);
            ssd = sum(sum((img1-tmp).^2));
            
            if ssd < min
                min = ssd;
                output = [x y];
            end
        end
    end
end