function w = Three_Layer_Case_2(i11,i12,i13,i2,N1,N2,O1,O2)

% case 3 layers mode = 1-2, P_CSI_RS >= 16
[k1,k2] = table522214(i13,N1,N2,O1,O2);
%% parameter l,m,p,n
l = i11;
m = i12;
p = i13;
n = i2;

%% phi_n, theta_p, v_l_m, v_l_m_n
phi_n = func_phi_n(n);
theta_p = func_theta_p(p);
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);
v_l_m_n = func_v_l_m_n(u_m,l,N1,O1);
P_CSI_RS = 2*N1*N2;

%% w
w = (1/sqrt(3*P_CSI_RS)) * ([v_l_m_n                  v_l_m_n                    v_l_m_n
                           theta_p*v_l_m_n          -theta_p*v_l_m_n          theta_p*v_l_m_n
                           phi_n*v_l_m_n            phi_n*v_l_m_n              -phi_n*v_l_m_n
                           phi_n*theta_p*v_l_m_n    -phi_n*theta_p*v_l_m_n     -phi_n*theta_p*v_l_m_n]);
end