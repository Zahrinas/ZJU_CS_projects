function [result] = D_LC(img, watermark)

    [sizeX, sizeY] = size(img);
    watermark = watermark(1:sizeX, 1:sizeY);
    result = sum(sum(img .* watermark)) / sizeX / sizeY;
end