function [ params ] = TransformationParams3( pts1,pts2 )


pts1=(pts1');
%pts1=(pts1);
pts2=(pts2');
%pts2=(pts2);



%pt1size=size(pts1);
%pt2size=size(pts2);

pts1=[pts1; ones(1,3)];
pts2=[pts2; ones(1,3)];
params= pts1*inv(pts2);


end

