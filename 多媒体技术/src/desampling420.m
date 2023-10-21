function [ret] = desampling420(matrix, pageX, pageY)

    ret = zeros([8 * pageX, 8 * pageY]);
    
    for i = 1 : 8 * pageX
        for j = 1 : 8 * pageY
            ii = floor(i / 2);
            ij = floor(j / 2);
            if mod(i, 2) == 1 && mod(j, 2) == 1
                ret(i, j) = matrix(ii + 1, ij + 1);
            elseif mod(i, 2) == 0 && mod(j, 2) == 1
                ret(i, j) = matrix(ii, ij + 1);
                %ret(i, j) = (matrix(ii, ij + 1) + matrix(ii + 1, ij + 1)) / 2;
            elseif mod(i, 2) == 1 && mod(j, 2) == 0
                ret(i, j) = matrix(ii + 1, ij);
                %ret(i, j) = (matrix(ii + 1, ij) + matrix(ii + 1, ij + 1)) / 2;
            else
                ret(i, j) = matrix(ii, ij);
                %ret(i, j) = (matrix(ii, ij) + matrix(ii + 1, ij + 1)) / 2;
            end
        end
    end
end

