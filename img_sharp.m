function [prop, cont, mn_grad] = img_sharp(img)

%img = imread('/home/ravi/Desktop/matlab/project_imagesharp/Lena.png');
%--------gaussian smoothing filter-------
[img] = im_avg(img);
%------- image gradient , theta----------
[img_grad,theta] = im_gradient(img);
%-------mean_grad and threshold---------
[mn_grad,thrs] = mean_grad(img_grad);
%--------WlsFilter------------------
[img_wls] = wlsFilter(img,0.5);
%--------gradient of wls-----------
[w_img_grad,w_t] = im_gradient(img_wls);

%------logic---------
[r,c] = size(img);
flag = zeros(r,c);
prop = zeros(1,11);

for i = 2:r-1
    for j = 2:c-1
        if ((flag(i,j) == 1) || (img_grad(i,j)<10))
            flag(i,j) = 1;            
        else
            if (thrs < img_grad(i,j))
                [ew , flag] = edge_width(w_img_grad,theta,flag,i,j);
                if ew>11
                    ew =11;
                elseif ew<3
                    ew = 3;
                end
                prop(ew) = prop(ew)+1;
            else
                [ew, flag] =edge_width(img_grad,theta,flag,i,j);
                if ew>11
                    ew =11;
                elseif ew<3
                    ew = 3;
                end
                prop(ew) = prop(ew) + 1;
            end
        end
    end
end  


prop = prop(3:11);
prop = prop/sum(prop);
if mn_grad >= 500
    cont = 1-exp(-1);
elseif mn_grad < 500
    cont = 1 - exp(mn_grad/500);
end
end
