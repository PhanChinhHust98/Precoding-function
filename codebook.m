function w = codebook(codebookType, L, codebookMode, i11, i12, i13,i141, i142, i143, i2, i20,i21,i22,Ng, N1,...
    N2, O1, O2)

if codebookType == 0 % Type I - Single Panel
    w = codebook_type_I_Single_Panel(L, codebookMode, i11, i12, i13, i2, N1,...
        N2, O1, O2);
    
elseif codebookType == 1 % Type I - Multi Panel
    w = codebook_type_I_Multiple_Panel(L,codebookMode,i11, i12, i13, i141, i142, i143, i2, i20, i21, i22, Ng, N1, N2, O1, O2);
    
elseif codebookType == 2 % Type II
    
elseif codebookType == 3 % Type II - Port Selection
    
else
    w = NaN;
    disp('Error at codebook type checking function');
end

end