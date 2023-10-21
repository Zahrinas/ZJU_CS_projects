function [vec] = codeToVec(code, len)

    vec = [];
    
    for i = 1 : len
        code = cast(code, "double");
        vec = [mod(code, 2), vec];
        code = floor(code / 2);
    end
    
    vec = flip(vec);
end

