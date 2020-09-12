function v_l_m_n = func_v_l_m_n(u_m,l,N1,O1)

v_l_m_n = zeros(1,N1/2);

    for k = 0:1:(N1/2-1)
       %v_l_m_n(i+1) = u_m*exp((i*4*pi*i*l)/(O1*N1)); 
       v_l_m_n(k+1) = exp((1i*4*pi*l*k)/(O1*N1));
    end
    
    clear k;
    
    v_l_m_n = (kron(v_l_m_n,u_m)).'; 
end