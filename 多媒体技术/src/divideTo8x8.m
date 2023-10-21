function [ret, pageX, pageY] = divideTo8x8(image)

    [sizeX, sizeY] = size(image);
    pageX = sizeX / 8;
    pageY = sizeY / 8;
    
    ret = zeros([8, 8, pageX, pageY]);
    
    for i = 1 : pageX
        for j = 1 : pageY
            ret(:, :, i, j) = image((pageX * 8 - 7) : (pageX * 8), (pageY * 8 - 7) : (pageY * 8));
        end
    end
end

