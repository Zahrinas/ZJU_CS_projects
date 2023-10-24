len = 3 * 8 * 1024;
message = randi(2, [1, len]) - 1;
image = imread(fullfile('data', '19.gif'));
image = cast(image, "double") - 128;
imwrite((image + 128) / 256, fullfile('result', '19.png'));
lst = rearrangeCoe(getJpegCoe(image));

%Task 1
figure(1);
histogram(lst, 'BinWidth', 1);
xlim([-10, 10]);
ylim([0, 5000]);

%Task 2
embedded_F5 = F5_embed_1(lst, message);
image = deJpeg(restoreCoe(embedded_F5));
imwrite((image + 128) / 256, fullfile('result', '19_F5_1.png'));
embedded_F5 = rearrangeCoe(getJpegCoe(image));
decode_F5 = F5_decode_1(embedded_F5, len);
cur_F5 = sum(decode_F5 == message) / len
figure(2);
histogram(embedded_F5, 'BinWidth', 1);
xlim([-10, 10]);
ylim([0, 5000]);

embedded_F5 = F5_embed_2(lst, message);
image = deJpeg(restoreCoe(embedded_F5));
imwrite((image + 128) / 256, fullfile('result', '19_F5_2.png'));
embedded_F5 = rearrangeCoe(getJpegCoe(image));
decode_F5 = F5_decode_2(embedded_F5, len);
cur_F5 = sum(decode_F5 == message) / len
figure(3);
histogram(embedded_F5, 'BinWidth', 1);
xlim([-10, 10]);
ylim([0, 5000]);

%Task 3
perm = randperm(512 * 512);
lstR = zeros([1, 512 * 512]);
for i = 1 : 512 * 512
    lstR(perm(i)) = lst(i);
end
embedded_F5R = F5_embed_1(lstR, message);
for i = 1 : 512 * 512
    embedded_F5(i) = embedded_F5R(perm(i));
end
image = deJpeg(restoreCoe(embedded_F5));
imwrite((image + 128) / 256, fullfile('result', '19_F5_R.png'));
embedded_F5 = rearrangeCoe(getJpegCoe(image));
for i = 1 : 512 * 512
    embedded_F5R(perm(i)) = embedded_F5(i);
end
decode_F5 = F5_decode_1(embedded_F5R, len);
cur_F5 = sum(decode_F5 == message) / len
figure(4);
histogram(embedded_F5, 'BinWidth', 1);
xlim([-10, 10]);
ylim([0, 5000]);