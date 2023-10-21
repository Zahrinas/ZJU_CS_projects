function [ret, delta] = decompress(vector, delta, pageX, pageY, arg)

    ret = zeros(8 * pageX, 8 * pageY);
    quanMat = getConstMatrix(arg);
    pre = 0;
    for i = 1 : pageX
        for j = 1 : pageY
            delta = delta + 1;
            pre = pre + vector(delta);
            ret(i * 8 - 7, j * 8 - 7) = pre;
        end
    end
    
    [DC, delta] = readCoe(vector, delta, pageX, pageY);
    ret = rearrangeDC(ret, DC, pageX, pageY);
    
    for i = 1 : pageX
        for j = 1 : pageY
            cur = ret((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8));
            cur = cur .* quanMat;
            cur = idct2(cur) + 128;
            ret((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8)) = cur;
        end
    end
end

