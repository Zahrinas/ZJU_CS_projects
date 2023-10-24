function [markedWork] = embed(cover, watermark, alpha)

    [sizeX, sizeY] = size(cover);
    watermark = watermark(1:sizeX, 1:sizeY);
    markedWork = cover + alpha * watermark;
end