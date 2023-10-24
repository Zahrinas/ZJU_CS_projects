function [out] = Viterbi_2(msg)

    transfer = [1, 3, 1, 3, 2, 4, 2, 4];
    msgOut = [[0, 0], [1, 1], [1, 0], [0, 1], [1, 1], [0, 0], [0, 1], [1, 0]];
    
    len = length(msg);
    dp = repmat(len + 1, [len / 2 + 1, 4]);
    from = zeros([len / 2, 4]);
    dp(1, 1) = 0;
    
    for i = 1 : len / 2
        for state = 1 : 4
            res = dp(i, state) + sum(abs(msgOut((state * 4 - 3) : (state * 4 - 2)) - msg((i * 2 - 1) : (i * 2))));
            if res < dp(i + 1, transfer(state * 2 - 1))
                dp(i + 1, transfer(state * 2 - 1)) = res;
                from(i, transfer(state * 2 - 1)) = state;
            end
            res = dp(i, state) + sum(abs(msgOut((state * 4 - 1) : (state * 4)) - msg((i * 2 - 1) : (i * 2))));
            if res < dp(i + 1, transfer(state * 2))
                dp(i + 1, transfer(state * 2)) = res;
                from(i, transfer(state * 2)) = state;
            end
        end
    end
    
    loc = 1;
    for i = 1 : 4
        if dp(len / 2 + 1, i) < dp(len / 2 + 1, loc)
            loc = i;
        end
    end
    
    out = zeros([1, len / 2]);
    for i = len / 2 : -1 : 1
        out(i) = sum(loc > 2);
        loc = from(i, loc);
    end
end