function Feature_vector=Perform_Feature_vector(input)
Nbscale=7;
Nbangle=16;
C = fdct_wrapping(input, 0, 1,Nbscale, Nbangle);
%feature extraction 
%level1
Interested_coef_level1 = fdct_wrapping_dispcoef(C(1));
SInterested_coef_level1=sort(Interested_coef_level1,'descend');
FInterested_coef_level1=SInterested_coef_level1(1:100);
%level2
Interested_coef_level2 = fdct_wrapping_dispcoef(C(2));
SInterested_coef_level2=sort(Interested_coef_level2,'descend');
FInterested_coef_level2=SInterested_coef_level2(1:100);
%level3
Interested_coef_level3 = fdct_wrapping_dispcoef(C(3));
SInterested_coef_level3=sort(Interested_coef_level3,'descend');
FInterested_coef_level3=SInterested_coef_level3(1:100);
%level4
Interested_coef_level4 = fdct_wrapping_dispcoef(C(4));
SInterested_coef_level4=sort(Interested_coef_level4,'descend');
FInterested_coef_level4=SInterested_coef_level4(1:100);
%level5
Interested_coef_level5 = fdct_wrapping_dispcoef(C(5));
SInterested_coef_level5=sort(Interested_coef_level5,'descend');
FInterested_coef_level5=SInterested_coef_level5(1:100);
%level6
Interested_coef_level6 = fdct_wrapping_dispcoef(C(6));
SInterested_coef_level6=sort(Interested_coef_level6,'descend');
FInterested_coef_level6=SInterested_coef_level6(1:100);
%level7
Interested_coef_level7 = fdct_wrapping_dispcoef(C(7));
SInterested_coef_level7=sort(Interested_coef_level7,'descend');
FInterested_coef_level7=SInterested_coef_level7(1:100);
Feature_vector=[FInterested_coef_level1,FInterested_coef_level2,FInterested_coef_level3,FInterested_coef_level4,FInterested_coef_level5,FInterested_coef_level6,FInterested_coef_level7];
