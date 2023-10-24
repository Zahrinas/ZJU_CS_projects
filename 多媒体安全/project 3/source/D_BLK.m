function [infm] = D_BLK(len, cover, watermark)

    mark = getMark(cover);
    
    infm = zeros([1, len]);
    for i = 1 : len
        infm(i) = D_CC(mark, watermark(:, :, i));
        infm(i) = (sign(infm(i)) + 1) / 2;
    end
end