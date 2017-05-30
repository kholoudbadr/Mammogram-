function ret = Classify( feature_vector_test , CALC_class_core_vector, ASYM_class_core_vector, CIRC_class_core_vector, MISC_class_core_vector, SPIC_class_core_vector, ARCH_class_core_vector, NORM_class_core_vector)

%distance
DIST_CALC=DISTANCE(CALC_class_core_vector,feature_vector_test);
DIST_ASYM=DISTANCE(ASYM_class_core_vector,feature_vector_test);
DIST_CIRC=DISTANCE(CIRC_class_core_vector,feature_vector_test);
DIST_MISC=DISTANCE(MISC_class_core_vector,feature_vector_test);
DIST_SPIC=DISTANCE(SPIC_class_core_vector,feature_vector_test);
DIST_ARCH=DISTANCE(ARCH_class_core_vector,feature_vector_test);
DIST_NORM=DISTANCE(NORM_class_core_vector,feature_vector_test);

%check minumm
Distances = [DIST_CALC, DIST_ASYM, DIST_CIRC, DIST_MISC, DIST_SPIC, DIST_ARCH, DIST_NORM];
Distances = sort(Distances);
min_DIST = Distances(1);

if min_DIST==DIST_CALC
    disp('CACL')
    ret = 'CACL';
elseif min_DIST==DIST_ASYM
    disp('ASYM')
    ret = 'ASYM';
elseif min_DIST==DIST_CIRC
    disp('CIRC')
    ret = 'CIRC';
elseif min_DIST==DIST_MISC
    disp('MISC')
    ret = 'MISC';
elseif min_DIST==DIST_SPIC
    disp('SPIC')
    ret = 'SPIC';
elseif min_DIST == DIST_ARCH
    disp('ARCH')
    ret = 'ARCH';
else
    disp('NORM')
    ret = 'NORM';
end

end

