function w_h = weight_horizontal(theta1)   

c = 3e8;        % propagation speed
fc = 3.7e8;     % carrier frequency
lambda = c/fc;
% theta1 = theta1/150*pi;
theta1 = theta1/144.6*pi;
d_horizon = lambda*55/81;
w_h = [exp(-j .* 0 .* d_horizon .* sin(theta1)*2*pi) exp(-j .* 1 .* d_horizon .* sin(theta1)*2*pi) exp(-j .* 2 .* d_horizon .* sin(theta1)*2*pi) exp(-j .* 3 .* d_horizon .* sin(theta1)*2*pi) exp(-j .* 4.* d_horizon .* sin(theta1)*2*pi) exp(-j .* 5 .* d_horizon .* sin(theta1)*2*pi) exp(-j .*6.* d_horizon .* sin(theta1)*2*pi) exp(-j .* 7 .* d_horizon .* sin(theta1)*2*pi)];
       
end