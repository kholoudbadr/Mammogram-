function FinalImage=Enhance(input)
% Read Image
i=imgetfile();
input=imread(i);
input = imresize(input, [512 512]);
if size(input, 3) == 3
input = rgb2gray(input);
end
figure, imshow(input), title('Original Image');
imwrite(input, 'E:\1.Original.png');

%% PreProcess

preprocessed= preprocess(input);
figure, imshow(preprocessed), title('preProcesed Image');
imwrite(preprocessed, 'E:\2.cropped.png');

%% Morphological Operations

morph= enhanced_log(preprocessed);
figure, imshow(morph), title('Morphological + Edge Enhancemengt');
imwrite(morph, 'E:\3.morph.png');

%% Wavelet denoising

denoisedImage=waveletDenoise(morph);
figure, imshow(denoisedImage), title('Wavelet Transformation');
imwrite(denoisedImage, 'E:\4.denoised.png');

%% CLAHE

value = adapthisteq(denoisedImage,'clipLimit',0.01,'Distribution','exponential', 'Alpha', 0.2, 'NBins', 128);
figure,imshow(value),title('Contrast Enhanced Image');
imwrite(value, 'E:\5.Clahe.png');

%% Guided Image Filtering

FinalImage=guided(value);
figure,imshow(FinalImage),title('Guided Image');
imwrite(FinalImage, 'E:\6.Guided.png');
figure,imshow(FinalImage);
%% Quality Metrics

display(PSNR(preprocessed,morph));
display(PSNR(preprocessed, denoisedImage));
value=imread('E:\5.Clahe.png');
display(PSNR(preprocessed,value));
FinalImage=imread('E:\6.Guided.png');
display(PSNR(preprocessed,FinalImage));
or=uint8(preprocessed);
value=double(value);
x1=callEPI(or, value);
x=callEPI(or, FinalImage);
display(x);
display(x1);