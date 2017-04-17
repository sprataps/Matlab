function [ out_img ] = gaussian1( in_img,wt )


%wt=[0.2500 0.2500 0.2500; 0.2500 0.4000 0.2500 ;0.2500 0.2500 0.2500 ];
%wt=[1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];


[row col]=size(in_img);

new_in_img=zeros(row+2,col+2);
new_in_img=cast(new_in_img,class(in_img));
new_in_img(2:end-1,2:end-1)=in_img;
new_in_img=double(new_in_img);


out_img = zeros(size(new_in_img));
out_img = cast(out_img, class(in_img));

[r c]=size(wt);
rowx=ceil(r/2);
colx=ceil(c/2);

filterx=double(wt(rowx,1:end));
filtery=double(wt(1:end,colx));

for i = 2:1:row+1
    for j = 2:1:col+1 
     
        value=0;
        for m = -1:1:1
                value=value +new_in_img(i,j+ m) * filterx(m+2);
        end
        out_img(i,j)=value;
    end
end
for i = 2:1:row+1
    for j = 2:1:col+1 
       
        value=0;
        for m = -1:1:1
                value=value+out_img( i+m,j) * filtery(m+2);
        end
        out_img(i,j)=value;
    end
end
out_img=out_img(2:end-1,2:end-1);

end

