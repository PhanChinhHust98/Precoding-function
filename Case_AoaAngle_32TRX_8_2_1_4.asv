clear all;
clc;

% Case 32TRX with (N1,N2,O1,O2) = (8,2,1,4).
% Control directly horizontal and vertical beams by functions with angle of arrival.

%% Parameter

N1 = 8;
N2 = 2;
O1 = 1;
O2 = 4;
c = 3e8;        % propagation speed
fc = 3.7e8;     % carrier frequency
lambda = c/fc;
d_horizon = lambda*55/81; % horizontal distance
d_vertical = lambda*45/81; % vertical distance

%% HORIZONTAL FINE BEAMS: 

    % 7 main horizontal fine beams
    
     horizontal1 = weight_horizontal(27);
     horizontal2 = weight_horizontal(18);
     horizontal3 = weight_horizontal(9);
     horizontal4 = weight_horizontal(0);
     horizontal5 = weight_horizontal(-9);
     horizontal6 = weight_horizontal(-18);
     horizontal7 = weight_horizontal(-27);
     
     % vector horizontal fine beams.
     horizontal = [horizontal1; horizontal2; horizontal3; horizontal4; horizontal5; horizontal6;horizontal7];
     
    % Compensate horizontal beams for case with coarses of two
    
     com_horizontal1 = weight_horizontal(26.5);
     com_horizontal2 = weight_horizontal(17);
     com_horizontal3 = weight_horizontal(8);
     com_horizontal4 = weight_horizontal(-1);
     com_horizontal5 = weight_horizontal(-10);
     com_horizontal6 = weight_horizontal(-18.5);
     % vector 
     com_horizontal = [com_horizontal1;com_horizontal2;com_horizontal3;com_horizontal4;com_horizontal5;com_horizontal6];
     
%%  VERTICAL FINE BEAMS 
      % 7 vertical fine beams
      vertical1 = weight_vertical(-9);
      vertical2 = weight_vertical(0);
      vertical3 = weight_vertical(9);
      
      vertical = [vertical1;vertical2;vertical3];

%% COARSE BEAMS
% Groups of two beams
for beamId = 8:1:13
    horizontal(beamId,:) =  com_horizontal(beamId-7,:) + horizontal(beamId-6,:);
end

%% Plot horizontal beam
for id = 1%:1:13
    weight_plot_horizontal = reshape(horizontal(id,:),N1*O1,1);
% Set up beam
antennaElement = phased.CrossedDipoleAntennaElement;  


txarray = phased.ULA('NumElements',N1*O1,'ElementSpacing',lambda*55/81,...
        'Element',antennaElement); 

pos = getElementPosition(txarray);
     
  hFig = figure(1);
                
                AzRange = -90:0.5:90;
                ElRange = -90:1:90;
               
                % Plot Array Factor - Azimuth
                subplot(2,2,1);
                pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',weight_plot_horizontal);
                
                az = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',weight_plot_horizontal);
                
                subplot(2,2,2);
                clear plot
                plot(AzRange,az);
                axis ([-100 100 -20 0]);
                tStr = sprintf('beamId = %d',id);
                title(tStr);
                grid on;            
           
end
clear id;

%% Plot vertical beam
clear figure(2);
for id = 1:1:3
    weight_plot_vertical = reshape(vertical(id,:),N2*O2,1);
% Set up beam
antennaElement = phased.CrossedDipoleAntennaElement; % dinh nghia phan cuc 


txarray = phased.ULA('NumElements',N2*O2,'ElementSpacing',lambda*55/81,...
        'Element',antennaElement); 

pos = getElementPosition(txarray);
     
  hFig = figure(2);
                
                AzRange = -90:0.5:90;
                ElRange = -90:1:90;
               
                % Plot Array Factor - Azimuth
                subplot(2,2,1);
                pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',weight_plot_vertical);
                
                az = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',weight_plot_vertical);
                
                subplot(2,2,2);
                clear plot
                plot(AzRange,az);
                axis ([-100 100 -20 0]);
                tStr = sprintf('beamId = %d',id);
                title(tStr);
                grid on;
    
end





 