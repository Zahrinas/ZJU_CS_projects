function deJpeg(fileName)
    
     struc = load(fullfile('mat', fileName) + '.mat');
    
    [dict, code] = getDictCode(fileName);
    
    msg = huffmandeco(code, dict);
    
    sizeX = msg(1);
    sizeY = msg(2);
    pageX = ceil(sizeX / 8);
    pageY = ceil(sizeY / 8);
    pageXBar = ceil(ceil(sizeX / 2) / 8);
    pageYBar = ceil(ceil(sizeY / 2) / 8);
    
    delta = 2;
    [imageY, delta] = decompress(msg, delta, pageX, pageY, 0);
    [imageU, delta] = decompress(msg, delta, pageXBar, pageYBar, 1);
    [imageV, ~] = decompress(msg, delta, pageXBar, pageYBar, 1);
    
    imageU = desampling420(imageU, pageX, pageY);
    imageV = desampling420(imageV, pageX, pageY);
    
    image = zeros([8 * pageX, 8 * pageY, 3]);
    image(:, :, 1) = imageY;
    image(:, :, 2) = imageU;
    image(:, :, 3) = imageV;
    
    image = YUV2RGB(image);
    
    image = cast(image(1:sizeX, 1:sizeY, :), "uint8");
    
    imwrite(image, fullfile('result', fileName));
end