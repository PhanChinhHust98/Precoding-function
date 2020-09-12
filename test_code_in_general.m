clear all;
clc;

codebookType = 1; codebookMode = 1;
L = 2;
i11 = 1; i12 = 1; i13 = 0;  
i141 = 1; i142 = 1; i143 = 1; 
i2 = 1;
i20 = 1; i21 = 1; i22 = 1;
Ng = 2;
N1 = 8;
N2 = 1;
O1 = 1;
O2 = 1;
if codebookType == 0 % Type I - Single Panel
    w = codebook_type_I_Single_Panel(L, codebookMode, i11, i12, i13, i2, N1,...
        N2, O1, O2);
elseif codebookType == 1 % Type I - Multi Panel
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
        elseif cdoebookMode == 2 && Ng == 2
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
        
    
elseif codebookType == 2 % Type II
    
elseif codebookType == 3 % Type II - Port Selection
    
else
    disp('Error at codebook type checking function');
end
