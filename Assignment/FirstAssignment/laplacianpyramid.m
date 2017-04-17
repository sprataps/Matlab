function [ Nimg2] = laplacianpyramid( Nimg,n )


for i=2:1:n
    
    
    
    %enlarged_img=expand(reduced_out_img);
    red_image=Nimg(i).img(:,:,1);
    green_image=Nimg(i).img(:,:,2);
    blue_image=Nimg(i).img(:,:,3);
    R_image1=expand(red_image);
    G_image1=expand(green_image);
    B_image1=expand(blue_image);
    enlarged_img=cat(3,R_image1,G_image1,B_image1);
    %size(enlarged_img)
    %size(Nimg(i-1).img)
    Nimg2(i-1).img=Nimg(i-1).img-enlarged_img;
    
end
Nimg2(n).img=Nimg(n).img;
    
end

