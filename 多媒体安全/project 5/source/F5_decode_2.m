function [message] = F5_decode_2(lst, len)

    message = zeros([1, len]);
    i = 1;
    j = 1;
    while j <= len
        message(j) = mod(lst(i) - lst(i + 1), 2);
        message(j + 1) = mod(lst(i) - lst(i + 2), 2);
        message(j + 2) = mod(lst(i) - lst(i + 3), 2);
        i = i + 4;
        j = j + 3;
    end
end