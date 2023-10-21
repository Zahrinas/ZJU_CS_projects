function [matrix] = rearrangeDC(matrix, DC, pageX, pageY)

    delta = 0;
    zigzagMat = getConstMatrix(2);
    for i = 1 : pageX
        for j = 1 : pageY
            cur = matrix((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8));
            for k = 1 : 8
                for l = 1 : 8
                    if k ~= 1 || l ~= 1
                        cur(k, l) = DC(delta + zigzagMat(k, l));
                    end
                end
            end
            matrix((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8)) = cur;
            delta = delta + 63;
        end
    end
end

