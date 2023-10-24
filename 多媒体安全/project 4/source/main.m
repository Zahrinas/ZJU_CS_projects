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
embedded_F3 = F3_embed(lst, message);
image = deJpeg(restoreCoe(embedded_F3));
imwrite((image + 128) / 256, fullfile('result', '19_F3.png'));
embedded_F3 = rearrangeCoe(getJpegCoe(image));
decode_F3 = F3_decode(embedded_F3, len);

cur_F3 = sum(decode_F3 == message) / len
figure(2);
histogram(embedded_F3, 'BinWidth', 1);
xlim([-10, 10]);
ylim([0, 5000]);

%Task 3
embedded_F4 = F4_embed(lst, message);
image = deJpeg(restoreCoe(embedded_F4));
imwrite((image + 128) / 256, fullfile('result', '19_F4.png'));
embedded_F4 = rearrangeCoe(getJpegCoe(image));
decode_F4 = F4_decode(embedded_F4, len);
cur_F4 = sum(decode_F4 == message) / len
figure(3);
histogram(embedded_F4, 'BinWidth', 1);
xlim([-10, 10]);
ylim([0, 5000]);