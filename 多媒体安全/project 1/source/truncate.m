function [work] = truncate(work)
    
    [sizeX, sizeY] = size(work);
    for i = 1:sizeX
        for j = 1:sizeY
            work(i, j) = round(work(i, j));
            if work(i, j) > 255
                work(i, j) = 255;
            end
            if work(i, j) < 0
                work(i, j) = 0;
            end
        end
    end
end