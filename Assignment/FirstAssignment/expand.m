function [ out_img ] = expand( in_img )

%wt=[0.2500 0.2500 0.2500; 0.2500 0.4000 0.2500 ;0.2500 0.2500 0.2500 ];
wt=[1/16 1/8 1/16; 1/8 1/4 1/8; 1/16 1/8 1/16];

[row col]=size(in_img);

row_expand=row*2;
col_expand=col*2;

new_in_img=zeros(row+2,col+2);
new_in_img=cast(new_in_img,class(in_img));
new_in_img(2:end-1,2:end-1)=in_img;
new_in_img=double(new_in_img);

out_img = zeros(row_expand, col_expand);
out_img= cast(out_img, class(in_img));

for i=0:row_expand-1
    for j=0:col_expand-1
        value=0;
        for m=-1:1
            for n=-1:1
                pixeli = (i - m)/2 ;
                pixelj = (j - n)/2 ;
                if ( (floor(pixeli) == pixeli) && (floor(pixelj) == pixelj ) && pixeli >= 0 && pixelj >= 0 )
                    pixeli = pixeli + 1;
                    pixelj = pixelj + 1;
                    tmpval=new_in_img(pixeli,pixelj)*wt(m+2,n+2);
                    value=value+tmpval;
                end
            end
        end
        out_img(i+1,j+1)=4*value;
    end
end

%out_img=out_img(2:end-1,2:end-1);
           

end

