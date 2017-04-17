function [out_img]= Convolve (in_img, filter)

[rows,column]=size (in_img);
in_filter = filter(end:-1:1,end:-1:1);
new_in_img= zeros(rows+2,column+2);
new_in_img= cast(new_in_img, class(in_img));

new_in_img(2:end-1,2:end-1)=in_img;

out_img= zeros(size(new_in_img));
out_img= cast(out_img,class(new_in_img));

for i=2:1:rows+1
    for j=2:1:column+1
        value=0;
        for g=-1:1:1
            for l=-1:1:1
                
                temp=new_in_img(i+g,j+l)*in_filter(g+2,l+2);
                
                value=value+temp;
            end
        end
        out_img(i,j)=value;
    end
end

out_img = out_img(2:end-1,2:end-1);
end
