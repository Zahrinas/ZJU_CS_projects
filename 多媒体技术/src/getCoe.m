function [AC, DC] = getCoe(matrix)

    [sizeX, sizeY] = size(matrix);
    pageX = sizeX / 8;
    pageY = sizeY / 8;
    AC = zeros([1, pageX * pageY]);
    DC = zeros([1, pageX * pageY * 63]);
    
    zigzagMat = getConstMatrix(2);
    
    for i = 1 : pageX
        for j = 1 : pageY
            for k = 1 : 8
                for l = 1 : 8
                    if k == 1 && l == 1
                        AC((i - 1) * pageY + j) = matrix((i - 1) * 8 + k, (j - 1) * 8 + l);
                    else
                        DC(((i - 1) * pageY + j - 1) * 63 + zigzagMat(k, l)) = matrix((i - 1) * 8 + k, (j - 1) * 8 + l);
                    end
                end
            end
        end
    end
end

