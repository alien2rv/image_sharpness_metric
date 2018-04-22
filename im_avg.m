function img_avg = im_avg(img)
%img = rgb2gray(img);
%img = double(img);
[r,c] = size(img);
img_avg = zeros(r,c);
a = 1/9; 

for i = 2:r-1
    for j = 2:c-1
        img_avg(i,j) = img(i-1,j-1)*a + img(i-1,j)*a + img(i-1,j+1)*a + img(i,j-1)*a + img(i,j)*a + img(i,j+1)*a + img(i+1,j-1)*a + img(i+1,j)*a + img(i+1,j+1)*a ;
    end
end

end