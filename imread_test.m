clc
clear all
close all
imagefiles = dir('/home/ravi/Desktop/project_imagesharp/src_imgs/*.png');      
nfiles = length(imagefiles); % Number of files found
val = zeros(11,nfiles);
for i=1:nfiles
   currentfilename = imagefiles(i).name;
   img = imread(currentfilename);
   img = rgb2gray(img);
   img = double(img);
   [prop,cont,mn_grad] = img_sharp(img);
   for j = 1:9
       val(i,j) = prop(j);
   end
   val(i,10) = cont;
   val(i,11) = mn_grad;
end
