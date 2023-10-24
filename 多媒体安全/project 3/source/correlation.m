function [cor] = correlation(mat1, mat2)

     mat1 = normalize(mat1, 'norm');
     mat2 = normalize(mat2, 'norm');
     cor = corrcoef(mat1, mat2);
     cor = cor(1, 2);
end