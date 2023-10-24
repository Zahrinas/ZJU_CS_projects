function [lst] = F3_embed(lst, message)

    i = 1;
    j = 1;
    while j ~= length(message) + 1
        if lst(i) ~= 0 
            if message(j) ~= mod(lst(i), 2)
                lst(i) = lst(i) - sign(lst(i));
            end
            if lst(i) ~= 0
                j = j + 1;
            end
        end
        i = i + 1;
    end
end