function [im_grad, theta] = im_gradient(img);

img = rgb2gray(img);
img = double(img);
[r,c] = size(img);
a = [-1 -2 -1 0 0 0 1 2 1];
b = [-1 0 1 -2 0 2 -1 0 1];
%----variables decleration----------
img_x = zeros(r,c);
img_y = zeros(r,c);
im_grad = zeros(r,c);
phi = zeros(r,c);
theta = zeros(r,c);

%-----Finding Gradient-----------
for i = 2:r-1
    for j = 2:c-1
        img_x(i,j) = img(i-1,j-1)*a(1) + img(i-1,j)*a(2) + img(i-1,j+1)*a(3) + img(i,j-1)*a(4) + img(i,j)*a(5) + img(i,j+1)*a(6) + img(i+1,j-1)*a(7) + img(i+1,j)*a(8) + img(i+1,j+1)*a(9);
        img_y(i,j) = img(i-1,j-1)*b(1) + img(i-1,j)*b(2) + img(i-1,j+1)*b(3) + img(i,j-1)*b(4) + img(i,j)*b(5) + img(i,j+1)*b(6) + img(i+1,j-1)*b(7) + img(i+1,j)*b(8) + img(i+1,j+1)*b(9); 
    end
end

for i = 1:r
    for j = 1:c
        im_grad(i,j) = sqrt((img_x(i,j))^2 + (img_y(i,j))^2);
    end
end

%------ phase and angle----------

for i = 1:r
    for j = 1:c
        if(img_x(i,j) == 0)
            phi(i,j) = 90;
        else
            phi(i,j) = atand(img_y(i,j)/img_x(i,j));
        end
    end
end

for i = 1: r
    for j = 1: c
     if((-22 <= phi(i,j)) && (phi(i,j) <= 22))
         theta(i,j) = 0;
     elseif((-68 < phi(i,j)) && (phi(i,j) < -22))
         theta(i,j) = 45;
     elseif((22< phi(i,j)) && (phi(i,j) < 68))
         theta(i,j) = 135;
     elseif((-90 < phi(i,j)) && (phi(i,j) <= -22)) || ((68<= phi(i,j)) && (phi(i,j) <= 90))
         theta(i,j) = 90;
     end
    end
end
             

