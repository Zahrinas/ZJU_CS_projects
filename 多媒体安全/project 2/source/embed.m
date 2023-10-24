function [markedWork] = embed(cover, watermark, infm, alpha)

    [sizeX, sizeY] = size(cover);
    markedWork = cover;
    for i = 1:8
        mki = watermark(:, :, i);
        mki = mki(1:sizeX, 1:sizeY);
        markedWork = markedWork + alpha * infm(i) * mki;
    end
end