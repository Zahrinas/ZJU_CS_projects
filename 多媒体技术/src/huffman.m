function [dict, code] = huffman(input)

    len = length(input);
    alpha = [];
    prob = [];
    for i = 1 : len
        flag = 0;
        lenD = length(alpha);
        for j = 1 : lenD
            if alpha(j) == input(i)
                flag = j;
                break;
            end
        end
        if flag ~= 0
            prob(flag) = prob(flag) + 1;
        else
            alpha = [alpha, input(i)];
            prob = [prob, 1.0];
        end
    end
    
    lenD = length(alpha);
    for i = 1 : lenD
        prob(i) = prob(i) / len;
    end
    
    dict = huffmandict(alpha, prob);
    code = huffmanenco(input, dict);
end