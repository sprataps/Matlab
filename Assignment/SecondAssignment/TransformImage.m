function [ transformed_image] = TransformImage( in_img, T )

temp=T(1,3);
T(1,3)=T(2,3);
T(2,3)=temp;


[row, col, dim] = size(in_img);
transformed_image = [];

for i = 1 : row
    for j = 1 : col
        temp_point = ceil(T * [i j 1]'); 
        if temp_point(1) > 0 && temp_point(2) > 0 
            for k = 1 : dim %for all i.e  rgb
                transformed_image(temp_point(1), temp_point(2), k) = in_img(i, j, k);%extracting transformed points  
            end
        end
    end
end

[row, col, dim]= size(transformed_image);

%for i = 1: row
%    for j=1 :col
%        for k=1 :dim
%            new_t(j,i,k)=transformed_image(i,j,k);
%        end
%    end
%end
%for i=1:3
%    new_t(:, :, i)=transformed_image(:, :, i)';
%end

end

