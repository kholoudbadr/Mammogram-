function value= enhanced_log(a)

[r,c]=size(a);

% unsharp masking
k=fspecial('unsharp',0.7);
un=imfilter(a,k);

k=fspecial('gaussian',[3 3],1);
f=imfilter(a,k);
%f1=uint8(f);
%imwrite(f, 'low_pass.bmp');
m11=min(min(f));
m1=max(max(f));
%figure,imshow(f),title('lowpass filter');
%pixval on;


f2=a-f;
%f5=uint8(f2);
m12=min(min(f2));
m2=max(max(f2));
mid1=abs(m12+m2)/2;
%figure,imshow(f2),title('highpass filter');
%pixval on;


BW = edge(f2,'log', 0); %return all edges that are stronger than threshold;
f3=BW;
se=strel('disk',5);

%%% top hat by opening%%%%
b1=imerode(f,se);
%figure,imshow(b1),title('erosion');
b11=imdilate(b1,se);
%figure,imshow(b11),title('opening');
b=imsubtract(f,b11);
%figure,imshow(b),title('tophat by opening');

%%%%%bottom hat by closing%%%
b11=imdilate(f,se);
%figure,imshow(b11),title('dilution');
b1=imerode(b11,se);
%figure,imshow(b1),title('closing');
c=imsubtract(b1,f);
%figure,imshow(c),title('bottomhat by closing');
e=f+b-c;
%figure,imshow(e),title('tophat-bottomhat');
%d=f1+b-c;
%figure,imshow(e),title('morphology enhanced image');

f6=f2+e;
value=f6;
%display(PSNR(a,f6));
%%%%%%%%%%%%%wavelet decomposition%%%%%%%%%%%%%%