function w = Four_Panel_2_Layer_Mode_1(i11,i12,i13,i141,i142,i143,i2,Ng,N1,N2,O1,O2)

%case 2 panel, 2 layer, mode = 1, Ng = 4;
% i14 = [i141, i142, i143];
% p = [p1,p2,p3]; p = i14;
% i2 = i2

%% Parameter l,m,p,n
[k1,k2] = table522222(i13,N1,N2,O1,O2);
l = i11;
l_1 = i11 + k1;
m = i12;
m_1 = i12 + k2;
i14 = [i141, i142, i143];
p = i14;
p1 = p(1);
p2 = p(2);
p3 = p(3);
n = i2;

%% v_l_m, phi_n, phi_p, number of antenna port
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);

u_m_1 = func_u_m(m_1,N2,O2);
v_l_m_1 = func_v_l_m(u_m_1,l_1,N1,O1);

phi_n = func_phi_n(n);
phi_p1 = func_phi_n(p1);
phi_p2 = func_phi_n(p2);
phi_p3 = func_phi_n(p3);

P_CSI_RS = 2*Ng*N1*N2;

%% w = 1/sqrt(2) [ w_(141)_l,m,p,n  w_(2,4,1)_l,m,p,n]
w_141 = (1/sqrt(P_CSI_RS)) * [v_l_m;
                              phi_n*v_l_m;
                              phi_p1*v_l_m;
                              phi_n*phi_p1*v_l_m;
                              phi_p2*v_l_m;
                              phi_n*phi_p2*v_l_m;
                              phi_p3*v_l_m;
                              phi_n*phi_p3*v_l_m];
                          
w_241 = (1/sqrt(P_CSI_RS)) * [v_l_m_1;
                              -phi_n*v_l_m_1;
                              phi_p1*v_l_m_1;
                              -phi_n*phi_p1*v_l_m_1;
                              phi_p2*v_l_m_1;
                              -phi_n*phi_p2*v_l_m_1;
                              phi_p3*v_l_m_1;
                              -phi_n*phi_p3*v_l_m_1];
                          
w = 1/sqrt(2) * [w_141 w_241];



end