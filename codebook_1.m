function w = codebook_1(codebookMode, i11, i12, i2, N1, N2, O1, O2)

% Case 1 layer, mode = 1 or mode = 2 vs N2 > 1 and mode = 2 vs N2 = 1
if codebookMode == 1
    w = One_Layer_Mode_1(i11, i12, i2, N1, N2, O1, O2);
elseif codebookMode == 2
    if N2 > 1
        w = One_Layer_Mode_2_1(i11, i12, i2, N1, N2, O1, O2);
    elseif N2 == 1
        w = One_Layer_Mode_2_2(i11, i12, i2, N1, N2, O1, O2);      
    else
        disp('Error in Type I Single Panel');
    end
else
    disp('Error in Type I Single Panel');
end

end