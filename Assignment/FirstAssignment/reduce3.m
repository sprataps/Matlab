function [ out_img ] = reduce3( in_img )

%wt=[0.2500 0.2500 0.2500; 0.2500 0.4000 0.2500 ;0.2500 0.2500 0.2500 ];
wt=[1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];


[row col]=size(in_img);

row_reduce=ceil(row*0.5);
col_reduce=ceil(col*0.5);

%disp(row_reduce);
%disp(col_reduce);

new_in_img=zeros(row+2,col+2);
new_in_img=cast(new_in_img,class(in_img));
new_in_img(2:end-1,2:end-1)=in_img;
new_in_img=double(new_in_img);


out_img = zeros(row_reduce, col_reduce);
out_img= cast(out_img, class(in_img));



for i = 0:row_reduce -1 
    for j = 0:col_reduce -1 
        %A=[];
        value=0;
        for m = -1 : 1
            for n = -1 : 1 
                %value=new_in_img(2*i+m+3,2*j+n+3)*wt(m+3)*wt(n+3);
                tmpval =  new_in_img(2 * i + m + 2, 2 * j + n + 2 ) * wt(m+2,n+2);
                value=value+tmpval ;
            end
        end
        out_img(i+1,j+1)=value;
    end
end

%size(out_img)
%out_img=out_img(1:end,1:end);
end

