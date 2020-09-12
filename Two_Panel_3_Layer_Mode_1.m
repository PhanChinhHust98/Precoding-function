function w = Two_Panel_3_Layer_Mode_1(i11,i12,i13,i141,i2,Ng,N1,N2,O1,O2)

% case 2 panel, 3 layer, Ng = 2;
% p = p1; p = i14; i14 = i141;
% i2 = i2;

%% Parameter l,m,p,n
[k1 k2] = table522222(i13,N1,N2,O1,O2);
l = i11;
l_1 = i11 + k1;
m = i12;
m_1 = i12 + k2;
p = i141;
p1 = p;
n = i2;

%% v_l_m, phi_n, phi_p1

u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);

u_m_1 = func_u_m(m_1,N2,O2);
v_l_m_1 = func_v_l_m(u_m_1,l_1,N1,O1);

phi_n = func_phi_n(n);
phi_p1 = func_phi_n(p1);

P_CSI_RS = 2*Ng*N1*N2;

%% w = 1/sqrt(3) * [w_121_l,m,p,n  w_121_l',m',p,n  w_221_l,m,p,n]

w_1211 = (1/sqrt(P_CSI_RS)) * [ v_l_m;
                                phi_n*v_l_m;
                                phi_p1*v_l_m;
                                phi_n*phi_p1*v_l_m];
                            
w_1212 = (1/sqrt(P_CSI_RS)) * [ v_l_m_1;
                                phi_n*v_l_m_1;
                                phi_p1*v_l_m_1;
                                phi_n*phi_p1*v_l_m_1];
                            
w_221 = (1/sqrt(P_CSI_RS)) * [ v_l_m;
                               -phi_n*v_l_m;
                               phi_p1*v_l_m;
                               -phi_n*phi_p1*v_l_m];

w = (1/sqrt(3)) * [w_1211 w_1212 w_221];
end