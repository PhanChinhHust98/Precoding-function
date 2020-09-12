function w = Two_Layer_Mode_2_1(i11,i12,i13,i2,N1,N2,O1,O2)

% case 2 layers mode = 2, N2  > 1
% parameter l,l',m,m',n
[k1,k2] = table522213(i13,N1,N2,O1,O2);
%% set up l & l'
if (i2 == 0 || i2 == 1 || i2 == 4 || i2 == 5)
   l_1 = 2*i11;
   l_2 = 2*i11 + k1;
elseif (i2 == 2 || i2 == 3 || i2 == 6 || i2 == 7)
    l_1 = 2*i11 + 1;
    l_2 = 2*i11 + 1 + k1;
else 
    disp('Error in l');
end

% set up m and m'
if ((i12 >= 0) && (i12 <= 3))
   m_1 = 2*i12;
   m_2 = 2*i12 + k2;
elseif ((i12 >= 4) && (i12 <= 7))
    m_1 = 2*i12 + 1;
    m_2 = 2*i12 + k2 + 1;
else
    disp('Error in m');
end

% set n
if (i2 == 0 || i12 == 2 || i2 == 4 || i2 == 6)
   n = 0;
elseif (i12 == 1 || i12 == 3 || i12 == 5 || i12 == 7)
    n = 1;
else
    disp('Error in n')
end

%% v_l_m, v_l'_m', phi_n, u_m, number of antenna port
phi_n = func_phi_n(n);
u_m_1 = func_u_m(m_1,N2,O2);
u_m_2 = func_u_m(m_2,N2,O2);
v_l_m_1 = func_v_l_m(u_m_1,l_1,N1,O1);
v_l_m_2 = func_v_l_m(u_m_2,l_2,N1,O1);
P_CSI_RS = 2*N1*N2;

%% Matrix w
w = (1/sqrt(2*P_CSI_RS)) * ([v_l_m_1 v_l_m_2 ; phi_n*v_l_m_1 -phi_n*v_l_m_2]);

end