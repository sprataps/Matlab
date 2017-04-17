in_img=imread('apple.jpg');

%kernel1=[0 0 0 5 0 0 0; 0 5 18 32 18 5 0; 0 18 64 100 64 18 0; 5 32 100 100 100 32 5; 0 18 64 100 64 18 0; 0 5 18 32 18 5 0; 0 0 0 5 0 0 0];
%kernel1=[1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];

kernel1=[.006;.061;.242;.383;.242;.061;.006];

imshow(in_img);
title('Original Image');
figure;

red_image=in_img(:,:,1);
green_image=in_img(:,:,2);
blue_image=in_img(:,:,3);

R_image=Gaussian(red_image,kernel1);
G_image=Gaussian(green_image,kernel1);
B_image=Gaussian(blue_image,kernel1);


out_img=cat(3,R_image,G_image,B_image);
imshow(out_img);

%title('Gaussian Smoothed Image');
%figure;

%size(in_img)
%reduce function call
red_image=in_img(:,:,1);
green_image=in_img(:,:,2);
blue_image=in_img(:,:,3);
R_image=reduce3(red_image);
G_image=reduce3(green_image);
B_image=reduce3(blue_image);
reduced_out_img=cat(3,R_image,G_image,B_image);
imshow(reduced_out_img);
title('Halved image');
%size(reduced_out_img)
figure;

%expand function call
red_image2=reduced_out_img(:,:,1);
green_image2=reduced_out_img(:,:,2);
blue_image2=reduced_out_img(:,:,3);
R_image2=expand(red_image2);
G_image2=expand(green_image2);
B_image2=expand(blue_image2);
enlarged_out_img=cat(3,R_image2,G_image2,B_image2);
imshow(enlarged_out_img);
title('Enlarged image');
%size(enlarged_out_img)
figure;

%gaussianpyramid
Nimg=gaussianpyramid(in_img,4);
for i=1:4
  imshow(Nimg(i).img);
  figure;
end


%laplacian pyramid
Nimg2=laplacianpyramid(Nimg,4);
for i=1:4
  imshow(Nimg2(i).img);
  figure;
end

%reconstruct
Nimg3=reconstruct(Nimg2,4);
for i=1:4
    imshow(Nimg3(i).img);
    figure;
end


%blending
in_img1=imread('apple.jpg');
in_img2=imread('orange.jpg');
%mask=imread('mask512.jpg');
blend_img=blend(in_img1,in_img2,4);
imshow(blend_img);

