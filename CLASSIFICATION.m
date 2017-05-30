ImgID = cell(322, 1);
for i = 1:322
str = '';
for j = 1:(3 - length(num2str(i)))
str = strcat(str, '0');
end
str = strcat(str, num2str(i));
ImgID{i} = str;
end

cnt = 0;
correct = 0;

for i = 1:322
dir = 'MIAS [Enhanced]\CACL\';
pth = strcat(dir, ImgID{i}, '.png');
if exist(pth, 'file')
    cnt = cnt + 1;
img = imread(pth);
feature_vector_test=Perform_Feature_vector(img);
ret = Classify(feature_vector_test , CALC_class_core_vector, ASYM_class_core_vector, CIRC_class_core_vector, MISC_class_core_vector, SPIC_class_core_vector, ARCH_class_core_vector, NORM_class_core_vector);
if (ret == 'CACL')
    correct = correct + 1;
end
end
end
ACCURACY = (correct / cnt)*100