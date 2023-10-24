function [message] = F3_decode(lst, len)

    message = zeros([1, len]);
    i = 1;
    j = 1;
    while j ~= len + 1
        if lst(i) ~= 0
            message(j) = mod(lst(i), 2);
            j = j + 1;
        end
        i = i + 1;
    end
end