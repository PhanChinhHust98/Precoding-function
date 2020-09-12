function u_m = func_u_m(m,N2,O2)

    if N2 > 1
        u_m = zeros(1,N2);
        
        for k = 0:1:(N2-1)
            u_m(k+1) = 1*exp((i*2*pi*k*m)/(O2*N2));
            %u_m(1,r+1) = exp((1i*2*pi*m*r)/(O2*N2));
        end
        clear k;
        
    elseif (N2 == 1)
        u_m = 1;
        
    else
        disp("N2 error");
    end

end