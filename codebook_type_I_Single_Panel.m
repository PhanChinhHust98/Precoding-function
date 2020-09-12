function w = codebook_type_I_Single_Panel(L, codebookMode, i11, i12, i13, i2, N1, N2, O1, O2)

if L == 1
    w = codebook_1(codebookMode, i11, i12, i2, N1, N2, O1, O2);
elseif L == 2
    w = codebook_2(codebookMode, i11, i12, i13, i2, N1, N2, O1, O2);
elseif L == 3
    w = codebook_3(i11, i12, i13, i2, N1, N2, O1, O2);
elseif L == 4
    w = codebook_4(i11, i12, i13, i2, N1, N2, O1, O2);
elseif L == 5
    w = Five_Layer(i11, i12, i2, N1, N2, O1, O2);
elseif L == 6
    w = Six_Layer(i11, i12, i2, N1, N2, O1, O2);
elseif L == 7
    w = Seven_Layer(i11, i12, i2, N1, N2, O1, O2);
elseif L == 8
    w = Eight_Layer(i11, i12, i2, N1, N2, O1, O2);
else
    disp('Error in number of Layer');
end

end