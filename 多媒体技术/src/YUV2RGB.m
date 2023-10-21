function [ret] = YUV2RGB(image)

    [sizeX, sizeY, sizeZ] = size(image);
    ret = zeros([sizeX, sizeY, sizeZ]);
    for i = 1 : sizeX
        for j = 1 : sizeY
            ret(i, j, 1) = 1 * image(i, j, 1) + 1.402 * (image(i, j, 3) - 128);
            ret(i, j, 2) = 1 * image(i, j, 1) - 0.34414 * (image(i, j, 2) - 128) - 0.71414 * (image(i, j, 3) - 128);
            ret(i, j, 3) = 1 * image(i, j, 1) + 1.772 * (image(i, j, 2) - 128);
        end
    end
end