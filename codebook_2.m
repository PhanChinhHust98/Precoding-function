function w = codebook_2(codebookMode, i11, i12, i13, i2, N1, N2, O1, O2)

%case 2 layers, mode = 1, mode = 2 vs N2 > 1, mode = 2 vs N2 = 1
if codebookMode == 1
    w = Two_Layer_Mode_1(i11,i12,i13,i2,N1,N2,O1,O2);
elseif codebookMode == 2
    if N2 > 1
        w = Two_Layer_Mode_2_1(i11,i12,i13,i2,N1,N2,O1,O2);
    elseif N2 == 1
        w = Two_Layer_Mode_2_2(i11,i12,i13,i2,N1,N2,O1,O2);
    else
        disp('Error at codebook Type I Single Panel - 2 layers');
    end
else
    disp('Error at codebook Type I Single Panel - 2 layers');
end

end