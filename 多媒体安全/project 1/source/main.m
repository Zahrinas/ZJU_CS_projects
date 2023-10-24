t_lc = 0.6;

% Task 1
files = dir('data');
files = files(3:end);
watermark = E_BLIND(19260817);
x1 = [];
x2 = [];
x3 = [];
fp = 0;
fn = 0;
for i = 1:40
    image = imread(fullfile('data', files(i).name));
    image = cast(image, "double");
    
    r1 = D_LC(image, watermark);
    x1 = [x1, r1];
    
    markedImage = embed(image, watermark, -1);
    r2 = D_LC(markedImage, watermark);
    x2 = [x2, r2];
    
    markedImage = embed(image, watermark, 1);
    r3 = D_LC(markedImage, watermark);
    x3 = [x3, r3];
    
    if r1 > t_lc
        fp = fp + 1;
    end
    if r3 < t_lc
        fn = fn + 1;
    end
    if r1 < -t_lc
        fp = fp + 1;
    end
    if r2 > -t_lc
        fn = fn + 1;
    end
end

x1 = sort(x1);
[y1, x1] = ksdensity(x1);
x2 = sort(x2);
[y2, x2] = ksdensity(x2);
x3 = sort(x3);
[y3, x3] = ksdensity(x3);
figure(1);
plot(x1, y1, 'r', x2, y2, 'g', x3, y3, 'b');
fprate = fp / 2 / 40
fnrate = fn / 2 / 40

% Task 2
image = imread(fullfile('data', 'couple.bmp'));
image = cast(image, "double");
x1 = [];
x2 = [];
x3 = [];
fp = 0;
fn = 0;
for i = 1:40
    watermark = E_BLIND(i);
    
    r1 = D_LC(image, watermark);
    x1 = [x1, r1];
    
    markedImage = embed(image, watermark, -1);
    r2 = D_LC(markedImage, watermark);
    x2 = [x2, r2];
    
    markedImage = embed(image, watermark, 1);
    r3 = D_LC(markedImage, watermark);
    x3 = [x3, r3];
    
    if r1 > t_lc
        fp = fp + 1;
    end
    if r3 < t_lc
        fn = fn + 1;
    end
    if r1 < -t_lc
        fp = fp + 1;
    end
    if r2 > -t_lc
        fn = fn + 1;
    end
end

x1 = sort(x1);
[y1, x1] = ksdensity(x1);
x2 = sort(x2);
[y2, x2] = ksdensity(x2);
x3 = sort(x3);
[y3, x3] = ksdensity(x3);
figure(2);
plot(x1, y1, 'r', x2, y2, 'g', x3, y3, 'b');
fprate = fp / 2 / 40
fnrate = fn / 2 / 40

x1 = [];
x2 = [];
x3 = [];
fp = 0;
fn = 0;
for i = 1:40
    watermark = E_BLIND(i);
    
    r1 = D_LC(image, watermark);
    x1 = [x1, r1];
    
    markedImage = embed(image, watermark, -1);
    markedImage = truncate(markedImage);
    r2 = D_LC(markedImage, watermark);
    x2 = [x2, r2];
    
    markedImage = embed(image, watermark, 1);
    markedImage = truncate(markedImage);
    r3 = D_LC(markedImage, watermark);
    x3 = [x3, r3];
    
    if r1 > t_lc
        fp = fp + 1;
    end
    if r3 < t_lc
        fn = fn + 1;
    end
    if r1 < -t_lc
        fp = fp + 1;
    end
    if r2 > -t_lc
        fn = fn + 1;
    end
end

x1 = sort(x1);
[y1, x1] = ksdensity(x1);
x2 = sort(x2);
[y2, x2] = ksdensity(x2);
x3 = sort(x3);
[y3, x3] = ksdensity(x3);
figure(3);
plot(x1, y1, 'r', x2, y2, 'g', x3, y3, 'b');
fprate = fp / 2 / 40
fnrate = fn / 2 / 40

% Task 3
image = imread(fullfile('data', 'rec.bmp'));
image = cast(image, "double");
x1 = [];
x2 = [];
x3 = [];
fp = 0;
fn = 0;
for i = 1:40
    watermark = E_BLIND(i);
    
    r1 = D_LC(image, watermark);
    x1 = [x1, r1];
    
    markedImage = embed(image, watermark, -1);
    r2 = D_LC(markedImage, watermark);
    x2 = [x2, r2];
    
    markedImage = embed(image, watermark, 1);
    r3 = D_LC(markedImage, watermark);
    x3 = [x3, r3];
    
    if r1 > t_lc
        fp = fp + 1;
    end
    if r3 < t_lc
        fn = fn + 1;
    end
    if r1 < -t_lc
        fp = fp + 1;
    end
    if r2 > -t_lc
        fn = fn + 1;
    end
end

x1 = sort(x1);
[y1, x1] = ksdensity(x1);
x2 = sort(x2);
[y2, x2] = ksdensity(x2);
x3 = sort(x3);
[y3, x3] = ksdensity(x3);
figure(4);
plot(x1, y1, 'r', x2, y2, 'g', x3, y3, 'b');
fprate = fp / 2 / 40
fnrate = fn / 2 / 40

x1 = [];
x2 = [];
x3 = [];
fp = 0;
fn = 0;
for i = 1:40
    watermark = E_BLIND(i);
    
    r1 = D_LC(image, watermark);
    x1 = [x1, r1];
    
    markedImage = embed(image, watermark, -1);
    markedImage = truncate(markedImage);
    r2 = D_LC(markedImage, watermark);
    x2 = [x2, r2];
    
    markedImage = embed(image, watermark, 1);
    markedImage = truncate(markedImage);
    r3 = D_LC(markedImage, watermark);
    x3 = [x3, r3];
    
    if r1 > t_lc
        fp = fp + 1;
    end
    if r3 < t_lc
        fn = fn + 1;
    end
    if r1 < -t_lc
        fp = fp + 1;
    end
    if r2 > -t_lc
        fn = fn + 1;
    end
end

x1 = sort(x1);
[y1, x1] = ksdensity(x1);
x2 = sort(x2);
[y2, x2] = ksdensity(x2);
x3 = sort(x3);
[y3, x3] = ksdensity(x3);
figure(5);
plot(x1, y1, 'r', x2, y2, 'g', x3, y3, 'b');
fprate = fp / 2 / 40
fnrate = fn / 2 / 40
