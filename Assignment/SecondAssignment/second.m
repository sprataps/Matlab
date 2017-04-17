img1=imread('1.jpg');
img2=imread('2.jpg');

img1=im2double(img1);
img2=im2double(img2);

disp('Select 3 points from this image');
imshow(img1);
points1=ginput(3);

imshow(img2);
points2=ginput(3);

param=TransformationParams3(points1,points2);

%for more than three parameters

disp('Now select five points on the images');
imshow(img1);
points1=ginput(5);
imshow(img2);
points2=ginput(5);

param2=TransformationParams(points2,points1);

%Displaying parameters obtained from extracting 3 points
%param=abs(param);
param
%Displaying parameters obtained from oextracting 5 points
%param2=abs(param3);

param2
%param2=abs(param2);
%Transform Image
img_new_2= TransformImage(img2,param2);
imshow(img_new_2);
title('Transformed Image :1');
figure;


[r1 c1 z1]=size(img1);
[r2 c2 z2]=size(img_new_2);

img_new_1=img1;

biggerr=max(r1,r2);
biggerc= max(c1,c2);
%The size of the transformed and the other image must be equal and values
%must be added at the end of images
if biggerr> r1
    img_new_1 = padarray(img_new_1, [biggerr - r1, 0], 0, 'post');
end

if biggerc > c1
    img_new_1 = padarray(img_new_1, [0, biggerc - c1], 0, 'post');
end

if biggerr > r2
    img_new_2 = padarray(img_new_2, [biggerr - r2, 0], 0, 'post');
end

if biggerc > c2
    img_new_2 = padarray(img_new_2, [0, biggerc - c2], 0, 'post');
end


%Stitching the images
stitched = double(max(img_new_1, img_new_2));
imshow(stitched);
title('Stitched Image 1');
figure;



%harris detector
img1=imread('1.jpg');
img2=imread('2.jpg');
points_1=Harris(img1);
points_2=Harris(img2);
s1=size(points_1);


s1

s2=size(points_2);
s2
mins=min(s1,s2);
if s1(1)>mins(1)
    for i=1:mins(1)
        for j=1:mins(2)
            point1(i,j)=points_1(i,j);
            points1(i,j)=point1(i,j);
            points2(i,j)=points_2(i,j);
        end
    end
    
elseif s2(1)>mins(1)
    for i=1:mins(1)
        for j=1:mins(2)
            point2(i,j)=points_2(i,j);
            points2(i,j)=point2(i,j);
            points1(i,j)=points_1(i,j);
        end
    end
    
end
size(points1)
size(points2)

%img1=rgb2gray(img1);
%img2=rgb2gray(img2);
param3=TransformationParams(points2,points1);
param3

%param3=abs(param3);
%img2=imread('2.jpg');
%img_new_3=TransformImage(img2,param3);

%imshow(img_new_3);
%title('Transformed Image : 2');
%figure;


%[r1 c1 z1]=size(img1);
%[r2 c2 z2]=size(img_new_3);

%img_new_1=img1;

%biggerr=max(r1,r2);
%biggerc= max(c1,c2);
%The size of the transformed and the other image must be equal and values
%must be added at the end of images
%if biggerr> r1
%    img_new_1 = padarray(img_new_1, [biggerr - r1, 0], 0, 'post');
%end

%if biggerc > c1
%    img_new_1 = padarray(img_new_1, [0, biggerc - c1], 0, 'post');
%end

%if biggerr > r2
%    img_new_3 = padarray(img_new_3, [biggerr - r2, 0], 0, 'post');
%end

%if biggerc > c2
%    img_new_3 = padarray(img_new_3, [0, biggerc - c2], 0, 'post');
%end


%Stitching the images
%stitched = double(max(img_new_1, img_new_3));
%title('Stitched Image 2');
%imshow(stitched);



