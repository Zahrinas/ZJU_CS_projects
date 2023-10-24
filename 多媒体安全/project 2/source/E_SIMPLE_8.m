function [watermark] = E_SIMPLE_8(seed)

    siz = 5312;
    watermark = zeros([siz, siz, 8]);
    rng(seed);
    for i =1:8
        watermark(:, :, i) = randn(siz, siz) / 8;
    end
end