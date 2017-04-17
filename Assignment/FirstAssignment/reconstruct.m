function [ Nimg3 ] = reconstruct( Nimg2 ,n )

Nimg3(4).img=Nimg2(4).img;
%size(Nimg3(4).img)
%gaussian_im=Nimg2(4).img;
for i=n-1:-1:1
   
    red_image=Nimg3(i+1).img(:,:,1);
    green_image=Nimg3(i+1).img(:,:,2);
    blue_image=Nimg3(i+1).img(:,:,3);
    R_image1=expand(red_image);
    G_image1=expand(green_image);
    B_image1=expand(blue_image);
    enlarge_img=cat(3,R_image1,G_image1,B_image1);
    %size(enlarge_img)
    %size(Nimg2(i).img);
    Nimg3(i).img=Nimg2(i).img+enlarge_img;
end


end

