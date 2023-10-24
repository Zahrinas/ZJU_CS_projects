function [lst] = F5_embed_1(lst, message)

    i = 1;
    j = 1;
    while j <= length(message)
        b1 = mod(lst(i + 1) - lst(i), 2);
        b2 = mod(lst(i + 1) - lst(i + 2), 2);
        if b1 ~= message(j) && b2 ~= message(j + 1)
            lst(i + 1) = bitxor(cast(lst(i + 1), "int32"), 1);
        elseif b1 ~= message(j)
            lst(i) = bitxor(cast(lst(i), "int32"), 1);
        elseif b2 ~= message(j + 1)
            lst(i + 2) = bitxor(cast(lst(i + 2), "int32"), 1);
        end
        i = i + 3;
        j = j + 2;
    end
end