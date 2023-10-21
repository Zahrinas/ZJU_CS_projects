function saveDictCode(fileName, dict, code)

    len = length(dict);
    savd = len;
    for i = 1 : len
        savd = [savd, cell2mat(dict(i, 1))];
        savd = [savd, length(cell2mat(dict(i, 2)))];
        savd = [savd, cast(vecToCode(cell2mat(dict(i, 2))), "int32")];
    end
    
    savc = [];
    len = length(code);
    savc = [savc, len];
    while mod(len, 32) ~= 0
        len = len + 1;
        code = [code, 0];
    end
    len = len / 32;
    for i = 1 : len
        savc = [savc, vecToCode(code((i * 32 - 31) : (i * 32)))];
    end
    
    savd = cast(savd, "int32");
    savc = cast(savc, "uint32");
    save(fullfile('mat', fileName) + '.mat', 'savd', 'savc');
end

