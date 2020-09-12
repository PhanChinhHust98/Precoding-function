function w = Two_Panel_3_Layer_Mode_2(i11,i12,i13,i141,i142,i20,i21,i22,Ng,N1,N2,O1,O2)

%case 2 panel, 3 layer, mode = 2
% p = [p1 p2]; p = i14; i14 = [i141 i142];
% n = [n0 n1 n2];

%% Parameter l,m,p,n
[k1 k2] = table522222(i13,N1,N2,O1,O2);
i14 = [i141 i142];
p = i14;
i2 = [i20 i21 i22];
n = i2;

l = i11;
l_1 = i11 + k1;
m = i12;
m_1 = i12 + k2;

p1 = p(1);
p2 = p(2);

n0 = n(1);
n1 = n(2);
n2 = n(3);

%% v_l_m, phi_n, a_p, b_n 
u_m = func_u_m(m,N2,O2);
v_l_m = func_v_l_m(u_m,l,N1,O1);

u_m_1 = func_u_m(m_1,N2,O2);
v_l_m_1 = func_v_l_m(u_m_1,l_1,N1,O1);

a_p1 = func_a_p(p1);
a_p2 = func_a_p(p2);

phi_n0 = func_phi_n(n0);
b_n1 = func_b_n(n1);
b_n2 = func_b_n(n2);

P_CSI_RS = 2*Ng*N1*N2;

%% w = 1/sqrt(3)*[w_122_l,m,p,n  w_122_l',m',p,n  w_222_l,m,p,n]

w_1221 = (1/sqrt(P_CSI_RS)) * [ v_l_m;
                                phi_n0*v_l_m;
                                a_p1*b_n1*v_l_m;
                                a_p2*b_n2*v_l_m];
                            
w_1222 = (1/sqrt(P_CSI_RS)) * [ v_l_m_1;
                                phi_n0*v_l_m_1;
                                a_p1*b_n1*v_l_m_1;
                                a_p2*b_n2*v_l_m_1];

w_222 = (1/sqrt(P_CSI_RS)) * [  v_l_m;
                                -phi_n0*v_l_m;
                                a_p1*b_n1*v_l_m;
                                -a_p2*b_n2*v_l_m];
                            
w = (1/sqrt(3)) * [w_1221 w_1222 w_222];

end