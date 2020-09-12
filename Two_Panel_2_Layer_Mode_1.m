function w = Two_Panel_2_Layer_Mode_1(i11,i12,i13,i141,i2,Ng,N1,N2,O1,O2)

% 2 layer, Ng = 2, mode = 1
% i14 = i141;
% i2 = i2 
% p = p1;

%% parameter l, m, p, n
[k1,k2] = table522222(i13,N1,N2,O1,O2);
l = i11;
l_1 = i11+ k1;
m = i12;
m_1 = i12 + k2;
i14 = i141;
p1 = i14;
n = i2;

%% v_l_m, phi_n, phi_p, 
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);

u_m_1 = func_u_m(m_1,N2,O2);
v_l_m_1 = func_v_l_m(u_m_1,l_1,N1,O1);

phi_n = func_phi_n(n);
phi_p1 = func_phi_n(p1);

P_CSI_RS = 2*Ng*N1*N2;

%% w = [w_(121)_l,m,p,n   w_(221)_l',m',p,n]
w_121 = (1/sqrt(P_CSI_RS)) * [v_l_m;
                            phi_n*v_l_m;
                            phi_p1*v_l_m;
                            phi_n*phi_p1*v_l_m];
                        
w_221 = (1/sqrt(P_CSI_RS)) * [v_l_m_1;
                          -phi_n*v_l_m_1;
                          phi_p1*v_l_m_1;
                          -phi_n*phi_p1*v_l_m_1];
                      
w = 1/sqrt(2) * [w_121 w_221];
 
end