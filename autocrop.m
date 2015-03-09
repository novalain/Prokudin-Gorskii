% autocrop.m
% Automatically crops the image based on edge detection with canny method

function [cropped] = autocrop(colorim)

    threshold = 0.5;
    % 
    width = size(colorim,2);
    height = size(colorim,1);

    left = 1;
    right = size(colorim,2);
    top = 1;
    bottom = size(colorim,1);

    % Get edge images for every color channel
    edgeB = edge(colorim(:,:,3), 'canny');
    edgeG = edge(colorim(:,:,2), 'canny');
    edgeR = edge(colorim(:,:,1), 'canny');

    % Calculate the averages
    ave_x_B = mean(edgeB, 1);
    ave_y_B = mean(edgeB, 2);

    ave_x_G = mean(edgeG, 1);
    ave_y_G = mean(edgeG, 2);

    ave_x_R = mean(edgeR, 1);
    ave_y_R = mean(edgeR, 2);

    % From left to right
    for i=1:floor(width*0.1)

        if ave_x_B(:,i) > threshold
            left = i;
        elseif ave_x_G(:,i) > threshold
            left = i;
        elseif ave_x_R(:,i) > threshold
            left = i;
        end    
    end

    %Right to left
    for i=width:-1:floor(width*0.9)

        if ave_x_B(:,i) > threshold
            right = i;
        elseif ave_x_G(:,i) > threshold
            right = i;
        elseif ave_x_R(:,i) > threshold
            right = i;
        end  

    end

    % From top to bottom
    for i=1:floor(height*0.1)

        if ave_y_B(i,:) > threshold
            top = i;
        elseif ave_y_G(i,:) > threshold
            top = i;
        elseif ave_y_R(i,:) > threshold
            top = i;
        end  
    end  

    % From bottom to top
    for i=height:-1:floor(height*0.9)

        if ave_y_B(i,:) > threshold
            bottom = i;
        elseif ave_y_G(i,:) > threshold
            bottom = i;
        elseif ave_y_R(i,:) > threshold
            bottom = i;
        end  
    end  

    cropped = colorim(top:bottom,left:right, :);
end