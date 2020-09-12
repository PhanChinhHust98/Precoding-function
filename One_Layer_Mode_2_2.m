function w = One_Layer_Mode_2_2(i11,i12,i2,N1,N2,O1,O2)

% Case Mode = 2, N2 = 1;
% Parameters l,m,n
m = 0;
if ((i2 >= 0) && (i2 <= 3))
   l = 2*i11;
elseif ((i2 >= 4) && (i2 <= 7))
    l = 2*i11 + 1;
elseif ((i2>= 8) && (i2 <= 11))
    l = 2*i11 + 2;
elseif ((i2 >= 12) && (i2 <=15))
    l = 2*i11 + 3;
else
    disp('Error in parameter l')
end

if (i2 == 0 || i2 == 4 || i2 == 8 || i2 == 12)
   n = 0;
elseif (i2 == 1 || i2 == 5 || i2 == 9 || i2 == 13)
    n = 1
elseif (i2 == 2 || i2 == 6 || i2 == 10 || i2 == 14)
    n = 2;
elseif (i2 == 3 || i2 == 7 || i2 == 11 || i2 == 15)
    n = 3;
else 
    disp('Error in parameter n') 
end

% phi_n, v_l_m, number of antenna port 
phi_n = func_phi_n(n);
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);
P_CSI_RS = 2*N1*N2;

% w
w = (1/sqrt(P_CSI_RS))*([v_l_m; phi_n*v_l_m]); %Table 5.2.2.2.1-6

end