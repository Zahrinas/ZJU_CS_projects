function [lst] = F4_embed(lst, message)

    i = 1;
    j = 1;
    while j ~= length(message) + 1
        if lst(i) < 0 && mod(lst(i), 2) == message(j)
            lst(i) = lst(i) + 1;
        elseif lst(i) > 0 && mod(lst(i), 2) ~= message(j)
            lst(i) = lst(i) - 1;
        end
        if lst(i) ~= 0
            j = j + 1;
        end
        i = i + 1;
    end
end