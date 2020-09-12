function w = codebook_type_I_Multiple_Panel( L, codebookMode, i11, i12, i13, i141, i142, i143, i2, i20,i21,i22,Ng, N1,...
    N2, O1, O2)
if L ==1 
       if codebookMode == 1 && Ng  == 2 
          w =  Two_Panel_1_Layer_Mode_1(i11,i12,i141,i142,i20,i21,i22,Ng,N1,N2,O1,O2);
       elseif codebookMode == 1 && Ng == 4
           w = Four_Panel_1_Layer_Mode_1(i11,i12,i141,i142,i143,i2,Ng,N1,N2,O1,O2);
       elseif codebookMode == 2 && Ng == 2 
           w = Two_Panel_1_Layer_Mode_2(i11,i12,i141,i142,i20,i21,i22,Ng,N1,N2,O1,O2);
       else
           w = NaN;
           disp("Error in input");
       end
    elseif L == 2
        if codebookMode == 1 && Ng == 2
            w = Two_Panel_2_Layer_Mode_1(i11,i12,i13,i141,i2,Ng,N1,N2,O1,O2);
        elseif codebookMode == 1 && Ng == 4
            w = Four_Panel_2_Layer_Mode_1(i11,i12,i13,i141,i142,i143,i2,Ng,N1,N2,O1,O2);
        elseif codebookMode == 2 && Ng == 2
            w =  Two_Panel_2_Layer_Mode_2(i11,i12,i13,i141,i142,i20,i21,i22,Ng,N1,N2,O1,O2);
        else
            w = NaN;
            disp ("Error in input");
        end
    elseif L == 3
        if codebookMode == 1 && Ng == 2
           w = Two_Panel_3_Layer_Mode_1(i11,i12,i13,i141,i2,Ng,N1,N2,O1,O2);
        elseif codebookMode == 1 && Ng == 4
            w = Four_Panel_3_Layer_Mode_1(i11,i12,i13,i141,i142,i143,i2,Ng,N1,N2,O1,O2);
        elseif codebookMode == 2 && Ng == 2
            w = Two_Panel_3_Layer_Mode_2(i11,i12,i13,i141,i142,i20,i21,i22,Ng,N1,N2,O1,O2);
        else 
            w = NaN;
            disp("Error in input");
        end
    elseif L == 4
        if codebookMode == 1 && Ng == 2
           w = Two_Panel_4_Layer_Mode_1(i11,i12,i13,i141,i2,Ng,N1,N2,O1,O2);
        elseif codebookMode == 1 && Ng == 4
            w = Four_Panel_4_Layer_Mode_1(i11,i12,i13,i141,i142,i143,i2,Ng,N1,N2,O1,O2);
        elseif codebookMode == 2 && Ng == 2
            w = Two_Panel_4_Layer_Mode_2(i11,i12,i13,i141,i142,i20,i21,i22,Ng,N1,N2,O1,O2);
        else 
            w = NaN;
            disp("Error in input");

        end 
end


end