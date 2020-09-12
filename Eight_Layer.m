function w = Eight_Layer(i11, i12, i2, N1, N2, O1, O2)

% case 8 layers

%%  l,l',l'',l''', m,m',m'',m''', n

l = i11;
l_1 = i11 + O1;

if ((N1 >= 4) && (N2 == 1))
    l_2 = i11 + 2*O1;
    l_3 = i11 + 3*O1;
    m = 0;
    m_1 = 0;
    m_2 = 0;
    m_3 = 0;
elseif ((N1 >= 2) && (N2 >= 2))
    l_2 = i11;
    l_3 = i11 + O1;
    m = i12;
    m_1 = i12;
    m_2 = i12 + O2;
    m_3 = i12 + O2;
else
    disp('Error at case_1_8_1_1');
end

n = i2;

%% phi_n, u_m, v_l_m, nember of antenna

phi_n = func_phi_n(n);

u_m = func_u_m(m, N2, O2);
v_l_m = func_v_l_m(u_m, l, N1, O1);

u_m_1 = func_u_m(m_1, N2, O2);
v_l_m_1 = func_v_l_m(u_m_1, l_1, N1, O1);

u_m_2 = func_u_m(m_2, N2, O2);
v_l_m_2 = func_v_l_m(u_m_2, l_2, N1, O1);

u_m_3 = func_u_m(m_3, N2, O2);
v_l_m_3 = func_v_l_m(u_m_3, l_3, N1, O1);
P_CSI_RS = 2*N1*N2;

%% w
w = (1/(sqrt(8*P_CSI_RS)))*([   v_l_m       v_l_m           v_l_m_1         v_l_m_1             v_l_m_2    v_l_m_2    v_l_m_3	v_l_m_3       ;
                                phi_n*v_l_m	-1*phi_n*v_l_m  phi_n*v_l_m_1	-1*phi_n*v_l_m_1	v_l_m_2	-1*v_l_m_2	v_l_m_3   -1*v_l_m_3	]);

end