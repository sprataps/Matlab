function [ points ] = Harris( img )

%using sobel operator for finding derivatives
sx=[-1 0 1; -2 0 2; -1 0 1];
sy= sx';

img=rgb2gray(img);

img_x= conv2(double(img),double(sx),'same');
img_y= conv2(double(img),double(sy),'same');

%calculating Ix2, Iy2, Ixy
img_x2= img_x .* img_x;
img_y2=img_y .* img_y;
img_xy=img_x .* img_y;

%summing values for M
w = (1/10^2) * ones(5);
sum_x= conv2(img_x2, w,'same');
sum_y= conv2( img_y2,w,'same');
sum_xy= conv2( img_xy,w,'same');
[rows,col]=size(img);

k=0.04;
im = zeros(rows, col);
bin=zeros(size(img));
for x=1:rows
   for y=1:col
      
       MM = [sum_x(x, y) sum_xy(x, y); sum_xy(x, y) sum_y(x, y)];
       MM= double(MM);
       R = det(MM) - k * (trace(MM) ^ 2);
       
       % 6) Threshold on value of R
       if (R > 20000)
          im(x, y) = R; 
          bin(x,y)=1;
       end
   end
end
%bin=cat(3,bin,bin,bin);
im= cat(3, im,im,im);
points = cell(sum(sum(bin)), 1);
[r ,c, z]=size(bin);
pindex=1;
%points=size(im);
%for w=1:z
%    for x = 1 : r
%        for y = 1 : c
%            if bin(x,y,z) == 1
                %disp(x);
                %disp(y);
                %disp(z);
                %points{pindex} = [x,y,z];
                %pindex = pindex + 1;
%            end
%        end
%    end
%end
[i,j]=find(bin>0);
points=[i,j];
imshow(im);
figure;
end
