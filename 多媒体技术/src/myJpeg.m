function myJpeg(fileName)
    
    image = imread(fullfile('data', fileName));
    image = cast(image, "double");
    [sizeX, sizeY, ~] = size(image);
    
    image = RGB2YUV(image);
    
    imageY = image(:, :, 1);
    imageU = subsampling420(image(:, :, 2));
    imageV = subsampling420(image(:, :, 3));
    
    compressedY = compress(imageY, 0);
    compressedU = compress(imageU, 1);
    compressedV = compress(imageV, 1);
    
    [dict, code] = huffman([sizeX, sizeY, compressedY, compressedU, compressedV]);
    
    saveDictCode(fileName, dict, code);
end