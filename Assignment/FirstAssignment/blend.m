function [ blend_img ] = blend( in_img1,in_img2,n)

in_img1_GP=gaussianpyramid(in_img1,n);
in_img1_LP=laplacianpyramid(in_img1_GP,n);

in_img2_GP=gaussianpyramid(in_img2,n);
in_img2_LP=laplacianpyramid(in_img2_GP,n);

%get mask input
imshow(in_img1);
title('Select Mask from this image');
mask=getrect();
%initialise mask
mask1=zeros(size(in_img1));
x=int16(mask(1));
y=int16(mask(2));
w=int16(mask(3));
h=int16(mask(4));

row=(y+h);
col=(x+w);
mask1=rgb2gray(mask1);

for i=y:1:row
    for j=x:1:col
        mask1(i,j)=1;
    end
end

mask1=cat(3,mask1,mask1,mask1);
mask1=double(mask1);

mask_GP=gaussianpyramid(mask1,4);
%for i=1:1:n
%    imshow(mask_GP(i).img);
%    figure;
%end


for i=1:1:n
    sub(i).img=ones(size(mask_GP(i).img));
end

for i=1:1:n
    mask2(i).img=sub(i).img-mask_GP(i).img;
    %imshow(mask2(i).img);
    %figure;
end



for i=4:-1:1
    %size(in_img1_LP(i).img)
    %size(in_img2_LP(i).img)
    %size(mask_GP(i).img)
    %size(sub(i).img)
    %in_img1_LP(i).img=rgb2gray(in_img1_LP(i).img);
    %in_img2_LP(i).img=rgb2gray(in_img2_LP(i).img);
    %mask_GP(i).img=rgb2gray(mask_GP(i).img);
    %sub(i).img=rgb2gray(sub(i).img);
    
    Lout(i).img= (((im2double(in_img1_LP(i).img)).*mask_GP(i).img)+((im2double(in_img2_LP(i).img)).*mask2(i).img));
    %Loutrgb(i).img=cat(3,Lout(i).img,Lout(i).img,Lout(i).img);
    %imshow(Loutrgb(i).img);
end

Lout=reconstruct(Lout,n);

%imgblend= in_img1.*mask_GP(1).img + in_img2.*mask2(1).img;
%imshow(imgblend);

blend_img=Lout(1).img;
