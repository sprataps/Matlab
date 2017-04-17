function [ out ] = Convolve(I, H)
%
% One may probably call this function the "heart" of 
% image processing & computer vision. Everything done on image
% follows convolution.. (not in a strict mathematical sense)
%
% I := Image (2D or 3D)
% H := Convolution Function (2D)
% out := Convolved Image
%

% Window size
[win_sx, win_sy] = size(H);  

% Window center
win_cx = ceil(win_sx / 2);
win_cy = ceil(win_sy / 2);

% Create the output matrix (Image (I) size will be altered later)
out = zeros(size(I));

% Zero padding on matrix
I = padarray(I, [win_cx - 1 win_cy - 1], 0, 'pre');
I = padarray(I, [win_sx - win_cx, win_sy - win_cy], 0, 'post');

[img_sx, img_sy, img_sz] = size(I);


% For each layer z := R/G/B or H/S/V or whatever...
for z = 1 : img_sz
    for x = win_cx : img_sx - (win_sx - win_cx)
        for y = win_cy : img_sy - (win_sy - win_cy)
            cx = x - (win_cx - 1) : x + (win_sx - win_cx);
            cy = y - (win_cy - 1) : y + (win_sy - win_cy);
            cnv_matrix = H .* I(cx, cy, z);
            out(x - (win_cx - 1), y - (win_cy - 1), z) = sum(sum(cnv_matrix));
        end
    end
end

end
