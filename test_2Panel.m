clear all;
clc;

% Codebook Type enumerations:
% codebookType
% 0 - Type I - Single Panel
% 1 - Type I - Multi Panel
% 2 - Type II
% 3 - Type II - Port Selection

% Ng - Number of panel
% N1 - Number of horizontal antenna element (azimuth)
% N2 - Number of vertical antenna element (elevation)
% O1 - Oversampling of horizontal antenna element (azimuth)
% O2 - Oversampling of vertical antenna element (elevation)
% L - Number of layer

% i11 - Steer beams in horizontal
% i12 - Steer beams in vertical

% Configurations

c = 3e8;        % propagation speed
fc = 3.5e9;     % carrier frequency
lambda = c/fc;	% wavelength

Ng = 1; % Number of sub-array
N1 = 4; % Number of horizontal antenna elements
N2 = 2; % Number of vertical antenna elements
O1 = 4; % Number of horizontal oversampling factor
O2 = 4; % Number of vertical oversampling factor
   
L = 1;

codebookMode = 1;
codebookType = 1;   % Type I - Multi Panel Panel

i11 = 1;
i12 = 1;
i13 = 0;
i2 = 0;
i3 = 0;
i141 = 1;

plot = 1;

%w = codebook(codebookType, L, codebookMode, i11, i12, i13, i2, N1, N2, O1, O2);

%% Set up beam
antennaElement = phased.CrossedDipoleAntennaElement; % dinh nghia phan cuc tron
% generate crossed-dipole antenna
% generate circularly polarized field: left and right
%antennaElement = phased.IsotropicAntennaElement;
if N2 ~= 1
    txarray = phased.URA('Size',[N1*O1 N2*O2],'ElementSpacing',[lambda/2 lambda/2],...
        'Element',antennaElement);
    % Uniform Rectangular Array
     
elseif N2 == 1
    txarray = phased.ULA('NumElements',N1*N2*O1*O2,'ElementSpacing',lambda/2,...
        'Element',antennaElement); 
    % Uniform Linear Array
end
pos = getElementPosition(txarray);

%               w = codebook(codebookType, L, codebookMode, i11, i12, i13, i2,...
%                     N1, N2, O1, O2);
                w = Two_Panel_1_Layer_Mode_1(i11,i12,i141,i2,Ng,N1,N2,O1,O2);

                w1 = w(1:numel(w)/4); 
                w2 = w(numel(w)/4+1:numel(w)/2); 
                w3 = w(numel(w)/2+1:numel(w)*(3/4));
                w4 = w(numel(w)*(3/4)+1:end);

                w1_s1 = reshape(w1, N2,N1).'; 
                w1_s = kron(w1_s1,ones(O1,O2)); 
                wt1 = reshape(w1_s.',[],1); 

                w2_s = reshape(w2, N2,N1).'; 
                w2_s = kron(w2_s,ones(O1,O2));
                wt2 = reshape(w2_s.',[],1);

                w3_s = reshape(w3, N2,N1).'; 
                w3_s = kron(w3_s,ones(O1,O2));
                wt3 = reshape(w3_s.',[],1);
                
                w4_s = reshape(w4, N2,N1).'; 
                w4_s = kron(w4_s,ones(O1,O2));
                wt4 = reshape(w4_s.',[],1);
                
                
                hFig = figure(1);
                set(gcf,'color','w');

                subplot(4,2,1); 
                pattern(txarray,fc,[-180:180],[-90:90],...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);

                subplot(4,2,2); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,3); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt3);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,4); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt4);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                hFig = figure(2);
                
                AzRange = -180:1:180;
                ElRange = -90:1:90;
                
              
                % Plot Array Factor - Azimuth
                subplot(2,2,1);
                pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                
                az = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                
                subplot(2,2,2);
                clear plot
                plot(AzRange,az);
                axis ([-100 100 -20 0]);
                grid on;
                
                % Plot Array Factor - Elevation
                subplot(2,2,3);
                pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                
                el = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                
                subplot(2,2,4);
                plot(ElRange,el);
                axis ([-100 100 -20 0]);
                grid on;
                
                % Plot 3D graph
                hFig = figure(3);
                
                subplot(2,2,[1 3]); 
                pattern(txarray,fc,[-180:180],[-90:90],...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);

                pause(0.05);

            
