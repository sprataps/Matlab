function [ out_img ] = Gaussian(in_img,filter )
%GAUSSIAN Summary of this function goes here
%   Detailed explanation goes here
[row,column]=size(in_img);

new_in_img= zeros(row+6,column+6);
new_in_img= cast(new_in_img, class(in_img));

new_in_img(4:end-3,4:end-3)=im2double(in_img);
new_in_img=double(new_in_img);

out_img= zeros(size(new_in_img));
out_img= cast(out_img,class(new_in_img));

%[filter_row,filter_column]=size(filter);

%filterx=double(filter(ceil(filter_row/2),1:end));
%filtery=double(filter(1:end,ceil(filter_column/2)));

for i=4:1:row
    for j=4:1:column
        value=0;
        for k=-3:1:3
            value=value+new_in_img(i,j+k)*filter(k+4);
        end
        out_img(i,j)=value;
    end
end

filter=filter';
for i=4:1:row
    for j=4:1:column
        value=0;
        for k=-3:1:3
            value=value+out_img(i+k,j)*filter(k+4);
        end
        out_img(i,j)=value;
    end
end
out_img=double(out_img);
out_img=out_img(4:end-3,4:end-3);
end

