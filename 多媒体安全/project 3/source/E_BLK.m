function [watermark] = E_BLK(len, seed)

    rng(seed);
    
    siz = 8;
    watermark = zeros([siz, siz, len]);
    for i =1 : len
        watermark(:, :, i) = randn(siz, siz) / len;
    end
end