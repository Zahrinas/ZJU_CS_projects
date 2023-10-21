function [DC, delta] = readCoe(vector, delta, pageX, pageY)

    DC = [];
    i = 1;
    while length(DC) < 63 * pageX * pageY
        for j = 1 : vector(delta + i * 2 - 1)
            DC = [DC, 0];
        end
        if vector(delta + i * 2) ~= 0
            DC = [DC, vector(delta + i * 2)];
        else
            delta = delta + i * 2;
            i = 0;
        end
        i = i + 1;
    end
end