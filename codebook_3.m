function w = codebook_3(i11, i12, i13, i2, N1, N2, O1, O2)

P_CSI_RS = 2*N1*N2;

if P_CSI_RS <16
    w = Three_Layer_Case_1(i11,i12,i13,i2,N1,N2,O1,O2);
elseif P_CSI_RS >= 16
    w = Three_Layer_Case_2(i11,i12,i13,i2,N1,N2,O1,O2);
else
    disp('Error in Type I Single Panel');
end

end