function [ret, pageX, pageY] = expandTo8x8(image)

    [sizeX, sizeY] = size(image);
    pageX = ceil(sizeX / 8);
    pageY = ceil(sizeY / 8);
    newX = pageX * 8;
    newY = pageY * 8;
    ret = zeros([newX, newY]);
    for i = 1 : newX
        for j = 1 : newY
            if i <= sizeX && j <= sizeY
                ret(i, j) = image(i, j);
            elseif i > sizeX
                ret(i, j) = ret(i - 1, j);
            else
                ret(i, j) = ret(i, j - 1);
            end
        end
    end
end

