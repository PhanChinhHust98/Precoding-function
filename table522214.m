function [k1,k2] = table522214(i13,N1,N2,O1,O2)

%mapping k1 and k2 with i13 
if (i13 == 0) 
   if ((N1 == 2 && N2 == 1) || (N1 == 4 && N2 == 1) || (N1 == 6 && N2 == 1)...
          || (N1 == 2 && N2 == 2) || (N1 == 3 && N2 == 2)) 
      k1 = O1;
      k2 = 0;
   else
       k1 = NaN;
       k2 = NaN;
       disp('Error in N1 and N2');
   end
elseif(i13 == 1)
    if ((N1 == 4 && N2 == 1) || (N1 == 6 && N2 == 1))
       k1 = 2*O1;
       k2 = 0;
    elseif ((N1 == 2 && N2 ==2) || (N1 == 3 && N2 == 2))
        k1 = 0;
        k2 = O2;
    else 
        k1 = NaN;
        k2 = NaN;
        disp('Error in N1 and N2');
    end
elseif (i13 == 2)
    if ((N1 == 4 && N2 == 1) || (N1 == 6 && N2 == 1))
       k1 = 3*O1;
       k2 = 0;
    elseif ((N1 == 2 && N2 == 2) || (N1 == 3 && N2 == 2))
        k1 = O1;
        k2 = O2;
    else
        k1 = NaN;
        k2 = NaN;
        disp('Error in N1 and N2');
    end
elseif (i13 == 3)
    if (N1 == 6 && N2 == 1)
        k1 = 4*O1;
        k2 = 0;
    elseif (N1 == 3 && N2 == 2)
        k1 = 2*O1;
        k2 = 0;
    else
        k1 = NaN;
        k2 = NaN;
        disp('Error in N1 and N2');
        
    end
else 
    k1 = NaN;
    k2 = NaN;
    disp('Error in i13');
end

end