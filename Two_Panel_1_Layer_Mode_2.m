function w = Two_Panel_1_Layer_Mode_2(i11,i12,i141,i142,i20,i21,i22,Ng,N1,N2,O1,O2)

% case 2 panels, mode = 2, Ng = 2, 
% i14 = [i141, i142];
% i2 = [i20,i21,i22];
% p = [p1 p2]; vs i14
% n = [n0 n1 n2]; vs i2

%% Parameter l,m,p,n
l = i11;
m = i12;
i14 = [i141 i142];
i2 = [i20 i21 i22];
p = i14;
p1 = p(1);
p2 = p(2);
n = i2;
n0 = n(1);
n1 = n(2);
n2 = n(3);

%% v_l_m, phi_n, a_p, b_n, number of antenna
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);

phi_n0 = func_phi_n(n0);

a_p1 = func_a_p(p1);
a_p2 = func_a_p(p2);

b_n1 = func_b_n(n1);
b_n2 = func_b_n(n2);

P_CSI_RS = 2*Ng*N1*N2;

%% w vs w_(122)_l,m,p,n
w = (1/sqrt(P_CSI_RS)) * ([v_l_m;
                           phi_n0*v_l_m;
                           a_p1*b_n1*v_l_m;
                           a_p2*b_n2*v_l_m]);

end