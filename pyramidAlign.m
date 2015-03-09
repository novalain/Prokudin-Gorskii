% pyramidAlign.m
% Find matches in small images to use to match the bigger ones
% Recursive call while the size is bigger than 64 to get the coarsest offset
% Returns a displacement vector

%img1 - base
%img2 - image to align
%level - chosen by user how big the search window will be
%method - ssd or ncc method used for calculating the offset

function displacement = pyramidAlign(img1, img2, level, method) 

    if size(img1, 1) > 64 
        
        %I1 = impyramid(img1, 'reduce'); 
        %I2 = impyramid(img2, 'reduce'); 
        R1 = imresize(img1, 0.5);
        R2 = imresize(img2, 0.5);
        
        % Calculate the coarsest offset, calls the function again
        c_offset = pyramidAlign(R1, R2, level, method);
        switch(method)
            case 'ncc'
                displacement = ncc_offset(img1, img2, c_offset*2, level);
            case 'ssd'
                displacement = ssd_offset(img1, img2, c_offset*2, level);
        end
    else 
        switch(method)
            case 'ncc'
                displacement = ncc_offset(img1, img2, [0, 0], level);
            case 'ssd'
                displacement = ssd_offset(img1, img2, [0, 0], level);
        end    
    end 
end 