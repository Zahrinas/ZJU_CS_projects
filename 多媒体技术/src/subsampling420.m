function [ret] = subsampling420(matrix) 

    [sizeX, sizeY] = size(matrix);
    sizeX = cast(sizeX / 2, "int32");
    sizeY = cast(sizeY / 2, "int32");
    
    ret = zeros([sizeX, sizeY]);
    for i = 1 : sizeX
        for j = 1 : sizeY
            ret(i, j) = matrix(2 * i - 1, 2 * j - 1);
        end
    end
end