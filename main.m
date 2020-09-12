clear all;
clc;

c = 3e8;        % propagation speed
fc = 3.5e9;     % carrier frequency
lambda = c/fc;	% wavelength

Ng = 1; % Number of panel
N1 = 2; % Number of horizontal logical antenna
N2 = 1; % Number of vertical logical antenna
O1 = 4; % Horizontal oversampling
O2 = 1; % Vertical oversampling

antennaElement = phased.CrossedDipoleAntennaElement;    % Crossed dipole Antenna Elements

if N2 ~= 1  % Uniform Rectangular Arrays
    txarray = phased.URA('Size',[N1*O1 N2*O2],'ElementSpacing',[lambda/2 lambda/2],...
        'Element',antennaElement);
elseif N2 == 1  % Uniform Linear Arrays
    txarray = phased.ULA('NumElements',N1*N2*O1*O2,'ElementSpacing',lambda/2,...
        'Element',antennaElement);
end

pos = getElementPosition(txarray);  % Get positions of array elements

ang = [45;45];

sv = steervec(pos,ang);

tx = zeros(1, );

for i=1:10000
   tx(i) =  rand + 1i*rand;
end

rx = sv*tx;

steering_vector = sv'*sv;