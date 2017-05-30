function class_core_vector_ASYM = ASYM_class()
%read_image
class_core_vector_ASYM = zeros(1, 700);
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

for i = 1:322
dir = 'E:\fcis\4st\GP\GP Dataset\MIAS [Enhanced]\ASYM\';
pth = strcat(dir, ImgID{i}, '.png');
    if exist(pth, 'file')
        img = imread(pth);
        cnt = cnt + 1;
            if (cnt > 12)
                break
            end
        Feature_vector_tmp = Perform_Feature_vector(img);
        class_core_vector_ASYM = class_core_vector_ASYM + Feature_vector_tmp;
    end
end

class_core_vector_ASYM = class_core_vector_ASYM / 12;



