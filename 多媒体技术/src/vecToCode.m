function [ret] = vecToCode(vector)

    ret = 0;
    len = length(vector);
    for i = 32 : -1 : 1
        ret = ret * 2;
        if i <= len
            ret = ret + vector(i);
        end
    end
    
    ret = cast(ret, "uint32");
end