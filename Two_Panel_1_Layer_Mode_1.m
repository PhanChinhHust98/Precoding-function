function w = Two_Panel_1_Layer_Mode_1(i11,i12,i141,i2,Ng,N1,N2,O1,O2)

%Multiple Panel: Ng = 2;
%1 Layer, Mode = 1,
% i14 = i141
% p = p_1
% i2 = i2;

%% Parameter l,m,p,n
i14 = i141; % Ng = 2, mode = 1;
l = i11;
m = i12;
p = i14;
n = i2;

%% v_l_m,phi_p_1, phi_n, 
p_1 = p;
u_m  = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);
phi_n = func_phi_n(n);
phi_p_1 = func_phi_n(p_1);
P_CSI_RS = 2*Ng*N1*N2;

%% w
w = (1/sqrt(P_CSI_RS)) * ([v_l_m ; 
                           phi_n*v_l_m;
                           phi_p_1*v_l_m;
                           phi_n*phi_p_1*v_l_m]);

end