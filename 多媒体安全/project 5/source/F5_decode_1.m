function [message] = F5_decode_1(lst, len)

    message = zeros([1, len]);
    i = 1;
    j = 1;
    while j <= len
        message(j) = mod(lst(i + 1) - lst(i), 2);
        message(j + 1) = mod(lst(i + 1) - lst(i + 2), 2);
        i = i + 3;
        j = j + 2;
    end
end