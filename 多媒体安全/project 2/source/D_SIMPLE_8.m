function [infm] = D_SIMPLE_8(cover, watermark)

    [sizeX, sizeY] = size(cover);
    infm = zeros([1, 8]);
    for i = 1:8
        mki = watermark(:, :, i);
        mki = mki(1:sizeX, 1:sizeY);
        infm(i) = D_CC(cover, mki);
    end
end