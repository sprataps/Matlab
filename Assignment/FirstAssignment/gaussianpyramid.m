function [ Nimg ] = gaussianpyramid( in_img, n )

Nimg(1).img=in_img;
for i=1:1:n-1
    
    red_image=in_img(:,:,1);
    green_image=in_img(:,:,2);
    blue_image=in_img(:,:,3);
    R_image=reduce3(red_image);
    G_image=reduce3(green_image);
    B_image=reduce3(blue_image);
    reduced_out_img=cat(3,R_image,G_image,B_image);
    %imshow(reduced_out_img);
   
    %imshow(reduced_out_img);
    in_img=reduced_out_img;
    Nimg(i+1).img=in_img; 
    %size(Nimg(i).img)
        
end

end