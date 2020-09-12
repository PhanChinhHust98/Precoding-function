function w = weight_c(beamId,aoa_column,aoa_row,N1,N2,O1,O2)
    w = zeros(beamId,N2*O2,N1*O1);
        for column = 0:1:N1*O1/2-1
            for row = 0:1:N2*O2/2-1
                w(beamId,row+1,column+1) = (exp(1i*2*pi*row*aoa_row))...
                *(exp(1i*2*pi*column*aoa_column));
            end
        end
end
