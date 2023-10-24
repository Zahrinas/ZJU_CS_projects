function [lst] = F5_embed_2(lst, message)

    i = 1;
    j = 1;
    while j <= length(message)
        b1 = mod(lst(i) - lst(i + 1), 2);
        b2 = mod(lst(i) - lst(i + 2), 2);
        b3 = mod(lst(i) - lst(i + 3), 2);
        if b1 ~= message(j) && b2 ~= message(j + 1) &&  b3 ~= message(j + 2)
            lst(i) = bitxor(cast(lst(i), "int32"), 1);
        elseif b1 ~= message(j) && b2 ~= message(j + 1)
            lst(i + 1) = bitxor(cast(lst(i + 1), "int32"), 1);
            lst(i + 2) = bitxor(cast(lst(i + 2), "int32"), 1);
        elseif b1 ~= message(j) && b3 ~= message(j + 2)
            lst(i + 1) = bitxor(cast(lst(i + 1), "int32"), 1);
            lst(i + 3) = bitxor(cast(lst(i + 3), "int32"), 1);
        elseif b2 ~= message(j + 1) && b3 ~= message(j + 2)
            lst(i + 2) = bitxor(cast(lst(i + 2), "int32"), 1);
            lst(i + 3) = bitxor(cast(lst(i + 3), "int32"), 1);
        elseif b1 ~= message(j)
            lst(i + 1) = bitxor(cast(lst(i + 1), "int32"), 1);
        elseif b2 ~= message(j + 1)
            lst(i + 2) = bitxor(cast(lst(i + 2), "int32"), 1);
        elseif b3 ~= message(j + 2)
            lst(i + 3) = bitxor(cast(lst(i + 3), "int32"), 1);
        end
        i = i + 4;
        j = j + 3;
    end
end