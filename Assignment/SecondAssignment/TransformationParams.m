function [ params ] = TransformationParams( pt1,pt2 )


%pt1size=size(pt1);
pt1=(pt1');
pt2=(pt2');

pt1size=size(pt1);
pt1=[pt1; ones(1,pt1size(2))];

pt2size=size(pt2);
pt2=[pt2; ones(1, pt2size(2))];
%pt2=[pt2; ones(1,pt2size(2))];
params = pt2* pt1' * inv(pt1* pt1');



end

