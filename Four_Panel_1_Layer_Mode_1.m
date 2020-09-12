function w = Four_Panel_1_Layer_Mode_1(i11,i12,i141,i142,i143,i2,Ng,N1,N2,O1,O2)

% case 2 panels, mode = 1, Ng = 4; table 522223
% i1,4 = [i141, i142, i143]
% i2 = i2;
% p = [p1, p2, p3] vs [i141,i142,i143]

%% set parameter l,m,p,n
l = i11;
m = i12;
i14 = [i141 i142 i143];
p = i14; 
p1 = p(1);
p2 = p(2);
p3 = p(3);
n = i2;  

%% v_l_m, phi_n, phi_p, number of antenna
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);

phi_n = func_phi_n(n);

phi_p1 = func_phi_n(p1);
phi_p2 = func_phi_n(p2);
phi_p3 = func_phi_n(p3);

P_CSI_RS = 2*Ng*N1*N2;

%% w = w_(141)_l,m,p,n
w = (1/sqrt(P_CSI_RS)) * ([ v_l_m;
                            phi_n*v_l_m;
                            phi_p1*v_l_m;
                            phi_n*phi_p1*v_l_m;
                            phi_p2*v_l_m;
                            phi_n*phi_p2*v_l_m;
                            phi_p3*v_l_m;
                            phi_n*phi_p3*v_l_m]);






end