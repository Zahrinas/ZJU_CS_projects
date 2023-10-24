function [markedWork] = embed(cover, watermark, infm, alpha)

    [sizeX, sizeY] = size(cover);
    pageX = floor(sizeX / 8);
    pageY = floor(sizeY / 8);
    len = length(infm);
    
    markedWork = cover;
    for i = 1 : pageX
        for j = 1 : pageY
            cur = markedWork((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8));
            for k = 1 : len
                cur = cur + watermark(:, :, k) * (infm(k) * 2 - 1) * alpha;
            end
            markedWork((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8)) = cur;
        end
    end
end