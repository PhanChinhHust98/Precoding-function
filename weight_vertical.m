function w_v = weight_vertical(theta2)   

c = 3e8;        % propagation speed
fc = 3.7e8;     % carrier frequency
lambda = c/fc;
theta2 = theta2/118.3*pi;
d_vertical = lambda*45/81;

% w_v = [exp(-j .* 0 .* d_vertical .* sin(theta2)*2*pi) ;
% 
%              exp(-j .* 1 .* d_vertical .* sin(theta2)*2*pi);
%              
%              exp(-j .* 2 .* d_vertical .* sin(theta2)*2*pi);
%              
%              exp(-j .* 3 .* d_vertical .* sin(theta2)*2*pi);
%              
%              exp(-j .* 4 .* d_vertical .* sin(theta2)*2*pi);
%              
%              exp(-j .* 5 .* d_vertical .* sin(theta2)*2*pi);
%              
%              exp(-j .* 6 .* d_vertical .* sin(theta2)*2*pi);
%              
%              exp(-j .* 7 .* d_vertical .* sin(theta2)*2*pi);];


w_v = [exp(-j .* 0 .* d_vertical .* sin(theta2)*2*pi) exp(-j .* 1 .* d_vertical .* sin(theta2)*2*pi) exp(-j .* 2 .* d_vertical .* sin(theta2)*2*pi) exp(-j .* 3 .* d_vertical .* sin(theta2)*2*pi) exp(-j .* 4.* d_vertical .* sin(theta2)*2*pi) exp(-j .* 5 .* d_vertical .* sin(theta2)*2*pi) exp(-j .*6.* d_vertical .* sin(theta2)*2*pi) exp(-j .* 7 .* d_vertical .* sin(theta2)*2*pi)];
       
end