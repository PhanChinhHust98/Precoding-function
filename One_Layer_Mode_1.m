function w = One_Layer_Mode_1(i11,i12,i2,N1,N2,O1,O2)

%Parameters
l = i11;
m = i12;
n = i2;

%u_m, phi_n, v_l_m, number of antenna port
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);
phi_n = func_phi_n(n);
P_CSI_RS = 2*N1*N2;

%Following table 5.2.2.2.1-5
w = (1/sqrt(P_CSI_RS))*([v_l_m;phi_n*v_l_m]);

end
