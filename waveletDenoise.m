function b=waveletDenoise(image)

%figure,imshow(image), title('original');
[c,s]=wavedec2(image,2,'bior1.1');

ca2=appcoef2(c,s,'bior1.1',2);
ca1=appcoef2(c,s,'bior1.1',1);

[cH2,cV2,cD2]=detcoef2('all',c,s,2);
[cH1,cV1,cD1]=detcoef2('all',c,s,1);

%%%%%%%%%%%Thresholding Calculation%%%%%%%%%%

 
    MH=max(max(cH1));
    MH=log2(MH);
    MHL=1;
    TH=MH*MHL;
    
    
    MV=max(max(cV1));
    MV=log2(MV);
    MVL=0.3;
    TV=MV*MVL;
    
    MD=max(max(cD1));
    MD=log2(MD);
    MDL=0.3;
    TD=MD*MDL;
    
%     C1=2;
    MH2=max(max(cH2));
    MH2=log2(MH2);
    MHL2=1;
    TH2=MH2*MHL2;
    
    
    MV2=max(max(cV2));
    MV2=log2(MV2);
    MVL2=1;
    TV2=MV*MVL2;
    
    
    MD2=max(max(cD2));
     MD2=log2(MD2);
    MDL2=1;
    TD2=MD2*MDL2;
	
ch1 =wthresh(cH1,'s',TH);
cv1= wthresh(cV1,'s',TV);
cd1= wthresh(cD1,'s',TD);
ch2= wthresh(cH2,'s',TH2);
cv2= wthresh(cV2,'s',TV2);
cd2= wthresh(cD2,'s',TD2);


%%%%%%%%%%%%%%%reconstruction%%%%%%%%%%%%%%%

ca2=ca2(:)';
ch2=ch2(:)';
cv2=cv2(:)';
cd2=cd2(:)';
ch1=ch1(:)';
cv1=cv1(:)';
cd1=cd1(:)';
d=[ca2 ch2 cv2 cd2];
t=[ch1 cv1 cd1];
C=[d t];
b=waverec2(C,s,'bior1.1');
b=uint8(b);
%figure,imshow(b), title('denoised');