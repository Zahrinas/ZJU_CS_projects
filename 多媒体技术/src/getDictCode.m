function [dict, code] = getDictCode(fileName)

    vec = load(fullfile('mat', fileName) + '.mat');
    vecd = vec.savd;
    vecc = vec.savc;
    
    delta = 1;
    lend = vecd(delta);
    dict = cell(lend, 2);
    for i = 1 : lend
        delta = delta + 1;
        dict(i, 1) = {cast(vecd(delta), "double")};
        delta = delta + 1;
        lenC = vecd(delta);
        delta = delta + 1;
        dict(i, 2) = {cast(codeToVec(vecd(delta), lenC), "double")};
    end
    
    delta = 1;
    lenc = vecc(delta);
    code = [];
    for i = 2 : length(vecc)
        delta = delta + 1;
        code = [code, codeToVec(vecc(delta), 32)];
    end
    code = code(1 : lenc);
    code = cast(code, "double");
    
end

