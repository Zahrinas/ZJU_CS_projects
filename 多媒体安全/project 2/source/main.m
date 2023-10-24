files = dir('data');
files = files(3:end);

% Task 1
watermark = E_SIMPLE_8(19260817);
infm = (randi(2, [1, 8]) - 1) * 2 - 1;
fp = 0;
fn = 0;
er = 0;
for i = 1:40
    image = imread(fullfile('data', files(i).name));
    image = cast(image, "double");
    
    r1 = D_SIMPLE_8(image, watermark);
    
    markedImage = embed(image, watermark, infm, sqrt(8));
    r2 = D_SIMPLE_8(markedImage, watermark);
    
    if detect(r1) == 1
        fp = fp + 1;
    end
    if detect(r2) == 0
        fn = fn + 1;
    end
    
    flag = 0;
    for j = 1:8
        if sign(r2(j)) ~= sign(infm(j))
            flag = 1;
        end
    end
    er = er + flag;
end

fp = fp / 40
fn = fn / 40
er = er / 40

% Task 2
image = imread(fullfile('data', 'lena512.bmp'));
image = cast(image, "double");
infm = (randi(2, [1, 8]) - 1) * 2 - 1;
fp = 0;
fn = 0;
er = 0;
for i = 1:40
    watermark = E_SIMPLE_8(i);
    
    r1 = D_SIMPLE_8(image, watermark);
    
    markedImage = embed(image, watermark, infm, sqrt(8));
    r2 = D_SIMPLE_8(markedImage, watermark);
    
    if detect(r1) == 1
        fp = fp + 1;
    end
    if detect(r2) == 0
        fn = fn + 1;
    end
    
    flag = 0;
    for j = 1:8
        if sign(r2(j)) ~= sign(infm(j))
            flag = 1;
        end
    end
    er = er + flag;
end

fp = fp / 40
fn = fn / 40
er = er / 40

% Task 3
image = imread(fullfile('data', 'lena512.bmp'));
image = cast(image, "double");
infm = (randi(2, [1, 8]) - 1) * 2 - 1;
ers = [];
for i = 1:1024
    er = 0;
    
    watermark = E_SIMPLE_8(i);
    image = embed(image, watermark, infm, sqrt(8));
    
    if mod(i, 64) == 0
        for j = 1:i
            watermark = E_SIMPLE_8(j);
            res = D_SIMPLE_8(image, watermark);
            for k = 1:8
                if sign(res(k)) ~= sign(infm(k))
                    er = er + 1;
                end
            end
        end
        ers = [ers, er / i / 8]
    end
end
