function w = Four_Layer_Case_1(i11,i12,i13,i2,N1,N2,O1,O2)

% case 4 layer mode = 1-2, P_CSI_RS < 16
[k1,k2] = table522214(i13,N1,N2,O1,O2);
%% parameter l,l',m,m',n
l_1 = i11;
l_2 = i11 + k1;
m_1 = i12;
m_2 = i12 + k2;
n = i2;

%% phi_n, v_l_m, v_l'_m'
phi_n = func_phi_n(n);
u_m_1 = func_u_m(m_1,N2,O2);
u_m_2 = func_u_m(m_2,N2,O2);
v_l_m_1 = func_v_l_m(u_m_1,l_1,N1,O1);
v_l_m_2 = func_v_l_m(u_m_2,l_2,N1,O1);
P_CSI_RS = 2*N1*N2;

%% w
w = (1/sqrt(4*P_CSI_RS)) * ([ v_l_m_1          v_l_m_2         v_l_m_1         v_l_m_2
                            phi_n*v_l_m_1    phi_n*v_l_m_2   -phi_n*v_l_m_1  -phi_n*v_l_m_2]);


end