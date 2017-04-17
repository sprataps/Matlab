in_img=imread('mountain-04.jpg');
red_image=in_img(:,:,1);
green_image=in_img(:,:,2);
blue_image=in_img(:,:,3);

%kernel1=[-1 0 1; -2 0 2; -1 0 1];
kernel1=[1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];
R_image=Convolve(red_image,kernel1);
G_image=Convolve(green_image,kernel1);
B_image=Convolve(blue_image,kernel1);

imshow(cat(3,R_image,G_image,B_image));



