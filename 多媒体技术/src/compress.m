function [ret] = compress(matrix, arg)

    [matrix, pageX, pageY] = expandTo8x8(matrix);
    
    for i = 1 : pageX
        for j = 1 : pageY
            cur = matrix((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8)) - 128;
            cur = dct2(cur);
            cur = quantize(cur, arg);
            matrix((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8)) = cur;
        end
    end
    
    [AC, DC] = getCoe(matrix);
    AC = DPCM(AC);
    DC = RLE(DC);
    ret = [AC, DC];
end