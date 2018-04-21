clc
clear all
close all

img = imread('/home/ravi/Desktop/matlab/project_imagesharp/Lena.png');
[prop,cont,mn_grad] = img_sharp(img);

