function [ret] = quantize(matrix, arg)

    quanMat = getConstMatrix(arg);
    ret = cast(round(matrix ./ quanMat), "int32");
end