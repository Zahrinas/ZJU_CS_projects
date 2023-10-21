function [ret] = RLE(input)

    len = length(input);
    fir = 0;
    ret = [];
    for i = 1 : len
        if input(i) == 0
            fir = fir + 1;
        else
            ret = [ret, fir, input(i)];
            fir = 0;
        end
    end
    
    ret = [ret, fir, 0];
end

