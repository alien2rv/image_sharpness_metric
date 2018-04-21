function [ew,fl] = edge_width(img,theta,fl,a,b)

[r,c] = size(fl);
local_minimum = img(a,b);
local_maximum = 0;
next_value = 0;
temp_theta = theta(a,b);
k = theta(a,b);
ew = 1;

while (temp_theta == k)
    if (theta(a,b) == 45 )
        temp_theta = theta(a+1,b+1);
        next_value = img(a+1,b+1);
        fl(a,b) = 1;
        a = a+1;
        b = b+1;
    elseif (theta(a,b) == 135 )
        temp_theta = theta(a-1,b-1);
        next_value = img(a-1,b-1);
        fl(a,b) = 1;
        a = a-1;
        b = b-1;
    elseif (theta(a,b) == 0 )
        temp_theta = theta(a+1,b);
        next_value = img(a+1,b);
        fl(a,b) = 1;
        a = a+1;
    else (theta(a,b) == 90 )
        temp_theta = theta(a,b+1);
        next_value = img(a,b+1);
        fl(a,b) = 1;
        b = b+1;
    end    
    if (next_value > local_maximum)
        local_maximum = next_value;
    end
    if (next_value < local_minimum ||next_value < 0.1*local_maximum)
        break
    end
    ew = ew+1;
end 

