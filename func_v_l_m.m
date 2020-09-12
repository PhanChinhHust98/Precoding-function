function v_l_m = func_v_l_m(u_m,l,N1,O1)

v_l_m = zeros(1,N1);

    for k = 0:1:(N1-1)
       %v_l_m(k+1) =  u_m*exp((i*2*pi*k*l)/(O1*N1));
       v_l_m(k+1) = exp((1i*2*pi*l*k)/(O1*N1));
    end

v_l_m = (kron(v_l_m,u_m)).';
clear k;
end