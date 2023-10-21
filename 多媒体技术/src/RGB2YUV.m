function [ret] = RGB2YUV(image)

    [sizeX, sizeY, sizeZ] = size(image);
    ret = zeros([sizeX, sizeY, sizeZ]);
    for i = 1 : sizeX
        for j = 1 : sizeY
            ret(i, j, 1) = 0.299 * image(i, j, 1) + 0.587 * image(i, j, 2) + 0.114 * image(i, j, 3);
            ret(i, j, 2) = -0.1687 * image(i, j, 1) - 0.3313 * image(i, j, 2) + 0.5 * image(i, j, 3) + 128;
            ret(i, j, 3) = 0.5 * image(i, j, 1) - 0.4187 * image(i, j, 2) - 0.0813 * image(i, j, 3) + 128;
        end
    end
end