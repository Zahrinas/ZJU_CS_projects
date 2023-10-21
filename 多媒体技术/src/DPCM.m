function [ret] = DPCM(input)

    ret = input;
    len = length(input);
    
    for i = 2 : len
        ret(i) = input(i) - input(i - 1);
    end
end

