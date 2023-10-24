function [result] = D_CC(img, watermark)

    [sizeX, sizeY] = size(img);
    watermark = watermark(1 : sizeX, 1 : sizeY);
    result = correlation(img, watermark);
end
