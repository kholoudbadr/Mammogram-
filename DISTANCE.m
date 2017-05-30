function DIST=DISTANCE(class_core_vector,vector_test)
for index=1:700
    DIST1=power((class_core_vector(index)-vector_test(index)),2);
end
 DIST=sum(DIST1);
 DIST=sqrt(DIST);