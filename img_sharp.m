clc
clear all
close all

img = imread('/home/ravi/Desktop/matlab/project_imagesharp/Lena.png');

%------- image ggradient , theta----------
[img_grad,theta] = im_gradient(img);
%-------mean_grad and threshold---------
[mn_grad,thrs] = mean_grad(img_grad);
