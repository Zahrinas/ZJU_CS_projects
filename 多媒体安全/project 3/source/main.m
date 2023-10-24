files = dir('data');
files = files(3:end);
fileCnt = length(files);

%Task 1
watermark = E_BLK(8, 19260817);
infm = randi(2, [1, 8]) - 1;
er = 0;
for i = 1 : fileCnt
    image = imread(fullfile('data', files(i).name));
    image = cast(image, "double");
    
    markedImage = embed(image, watermark, infm, sqrt(8));
    res = D_BLK(8, markedImage, watermark);
    
    flag = 0;
    for j = 1 : 8
        if res(j) ~= infm(j)
            flag = 1;
        end
    end
    er = er + flag;
end

er = er / fileCnt

% Task 2
watermark = E_BLK(16, 19260817);
infmOrg = randi(2, [1, 8]) - 1;
infm = Trellis_2(infmOrg);
er = 0;
for i = 1 : fileCnt
    image = imread(fullfile('data', files(i).name));
    image = cast(image, "double");
    
    markedImage = embed(image, watermark, infm, sqrt(16));
    res = D_BLK(16, markedImage, watermark);
    res = Viterbi_2(res);
    
    flag = 0;
    for j = 1 : 8
        if res(j) ~= infmOrg(j)
            flag = 1;
        end
    end
    er = er + flag;
end

er = er / fileCnt

% Task 3
watermark = E_BLK(20, 19260817);
infmOrg = [randi(2, [1, 8]) - 1, 0, 0];
infm = Trellis_2(infmOrg);
er = 0;
for i = 1 : fileCnt
    image = imread(fullfile('data', files(i).name));
    image = cast(image, "double");
    
    markedImage = embed(image, watermark, infm, sqrt(20));
    res = D_BLK(20, markedImage, watermark);
    res = Viterbi_2(res);
    
    flag = 0;
    for j = 1 : 8
        if res(j) ~= infmOrg(j)
            flag = 1;
        end
    end
    er = er + flag;
end

er = er / fileCnt