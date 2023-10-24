function [watermark] = E_BLIND(seed)

    rng(seed);
    size = 5312;
    watermark = randn(size, size);
end