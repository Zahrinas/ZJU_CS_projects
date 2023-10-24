function [mark] = getMark(image)

    [sizeX, sizeY] = size(image);
    pageX = floor(sizeX / 8);
    pageY = floor(sizeY / 8);
    
    mark = zeros([8, 8]);
    for i = 1 : pageX
        for j = 1 : pageY
            mark = mark + image((i * 8 - 7) : (i * 8), (j * 8 - 7) : (j * 8));
        end
    end
    mark = mark / pageX / pageY;
end