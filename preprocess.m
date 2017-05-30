function I2= preprocess(imgFile1)

%% median filter
imgFile1 = medfilt2(imgFile1, [3 3]);
 
%% converting image to binary
I = im2bw(imgFile1, 0.0706);
L = bwlabel(I, 8);
STATS = regionprops(L, 'area'); % it selects the larger area and eleminates small areas 

BW2 = bwareaopen(I , 20000);
%figure, imshow(BW2),title('large portion selected');
BW2 = uint8(BW2);

II2 = BW2.*imgFile1;
%figure, imshow(II2),title('label removed image');


%% %%%CROP image%%%%
%%%%% know size of an image%%%%%

[r,c]=size(II2);

s=sum(II2);

for i=1:c
    if s(i)>2000
        init=i;
        break;
    end
end

init


for i=c:-1:init
    if s(i)>2000
        endp=i;
        break;
    end
end

endp

endpx=1024-endp;
width=1024-init-endpx;
I2 = imcrop(II2,[init 0 width 1024]);
%figure,imshow(I2),title('cropped image');
