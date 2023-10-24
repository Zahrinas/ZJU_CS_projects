function [out] = Trellis_2(msg)

    state = 1;
    transfer = [1, 3, 1, 3, 2, 4, 2, 4];
    msgOut = [[0, 0], [1, 1], [1, 0], [0, 1], [1, 1], [0, 0], [0, 1], [1, 0]];
    
    len = length(msg);
    out = zeros([1, 2 * len]);
    for i = 1 : len
        out((i * 2 - 1) : (i * 2)) = msgOut((state * 4 + msg(i) * 2 - 3) : (state * 4 + msg(i) * 2 - 2));
        state = transfer(state * 2 + msg(i) - 1);
    end
end