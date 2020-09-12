function [k1, k2] = table522222(i13,N1,N2,O1,O2)

if (i13 == 0)
   if((N1 == 2 && N2 == 1) || (N1 == 4 && N2 == 1) || (N1 == 8 && N2 == 1) ...
           || (N1 == 2 && N2 == 2) || (N1 == 4 && N2 == 2))
       k1 = O1;
       k2 = 0;
   else     
       disp('Error in N1 and N2');
       k1 = NaN;
       k2 = NaN;
   end
elseif (i13 == 1)
    if ((N1 == 4 && N2 == 1) || (N1 == 8 && N2 == 1))
       k1 = 2*O1;
       k2 = 0;
    elseif ((N1 == 2 && N2 == 2) || (N1 == 4 && N2 == 2))
        k1 = 0;
        k2 = O2;
    else
        disp('Error in N1 and N2');
        k1 = NaN;
        k2 = NaN;

    end
elseif (i13 == 2)
    if ((N1 == 4 && N2 == 1) || (N1 == 8 && N2 == 1))
       k1 = 3*O1;
       k2 = 0
    elseif((N1 == 2 && N2 == 2) || (N1 == 4 && N2 == 2))
        k1 = O1;
        k2 = O2;
    else
        disp('Error in N1 and N2');
        k1 = NaN;
        k2 = NaN;

    end
elseif (i13 == 3)
    if (N1 == 8 && N2 == 1)
       k1 = 4*O1;
       k2 = 0;
    elseif (N1 == 4 && N2 == 2)
        k1 = 2*O1;
        k2 = 0;
    end
else
    disp('Error in i13');
    k1 = NaN;
    k2 = NaN;

end

end