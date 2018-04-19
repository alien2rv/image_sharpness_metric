function [mn_grad,thrs] = mean_grad(img)
[r,c] = size(img);
img = round(img);
k = max(img(:));
hist = zeros(1,k+1);

for i = 1:r
    for j = 1:c
        k = img(i,j);
        hist(k+1) = hist(k+1) + 1;
    end
end
flp = fliplr(hist);

k=flp(1);
for i = 2: length(flp)
    flp(i) = flp(i) + k;
    k = flp(i);
end

for i = 1:length(flp)
    if( 50 <= flp(i))
        min_x = i;
        break
    end
end

for i = 1:length(flp)
    if( 150 <= flp(i))
        max_x = i;
        break
    end
end

min_x = length(flp) - min_x;
max_x = length(flp) - max_x;

k=0;
for i = max_x:1:min_x
    a = hist(i)*(i-1);
    k = k+a;
end

mn_grad = k/100;

if (500 <= mn_grad)
    thrs = 150;
elseif ((300 <= mn_grad) && (mn_grad < 500))
    thrs = 120;
else
    thrs = 0.3*mn_grad;
end
    
