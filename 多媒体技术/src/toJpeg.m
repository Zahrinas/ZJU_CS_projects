function toJpeg(fileName)

    image = imread(fullfile('data', fileName));
    imwrite(image, fullfile('result', append(fileName, '.jpeg')));
end