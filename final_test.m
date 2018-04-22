clc
clear all
close all

img = imread('/home/ravi/Desktop/project_imagesharp/src_imgs/1600.png');
img = double(rgb2gray(img));
[prop,cont,mn_grad] = img_sharp(img);

