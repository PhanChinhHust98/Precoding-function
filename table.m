function [k1, k2] = table(i13,N1,N2,O1,O2)
    
if i13 == 0
    k1 = 0;
    k2 = 0;
elseif i13 == 1
    k1 = O1;
    k2 =  0;
elseif i13 == 2
    if N1 == N2 && N1 > N2 > 1
        k1 = 0;
        k2 = O2;
    elseif N1 > 2 && N2 == 1
        k1 = 2*O1;
        k2 = 0;
    else 
        disp("Error");
    end
elseif i13 == 3
    if N1 > N2 > 1
       k1 = 2*O1;
       k2 = 0;
    elseif N1 == N2
        k1 = O1;
        k2 = O2;
    elseif N1 > 2 && N2 == 1
        k1 = 3*O1;
        k2 = 0;
    end
else 
    disp("Error");
    
end
end