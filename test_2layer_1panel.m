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
N1 = 8; % Number of horizontal antenna elements
N2 = 2; % Number of vertical antenna elements
O1 = 1; % Number of horizontal oversampling factor
O2 = 1; % Number of vertical oversampling factor
   
L = 2;

codebookMode = 1;
codebookType = 1;   % Type I - Multi Panel Panel

i11 = 1;
i12 = 1;
i13 = 0;
i2 = 0;
i20 = 1;
i21 = 1;
i22 = 1;
i3 = 0;
i141 = 1;
i142 = 1; 
i143 = 1;
plot = 1;

% w = codebook(codebookType, L, codebookMode, i11, i12, i13,i141, i142, i143, i2, i20,i21,i22,Ng, N1,...
%     N2, O1, O2)
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

   w = codebook(codebookType, L, codebookMode, i11, i12, i13,i141, i142, i143, i2, i20,i21,i22,Ng, N1,...
    N2, O1, O2)       
                w_1layer = w(:,1);
                w_2layer = w(:,2);
                
%% matrix with layer 1 in 2 layer.
                w1_1layer = w_1layer(1:numel(w_1layer)/2); 
                w2_1layer = w_1layer(numel(w_1layer)/2+1:end); 
                

                w1_s_1layer = reshape(w1_1layer, N2,N1).'; 
                w1_s_1layer = kron(w1_s_1layer,ones(O1,O2)); 
                wt1_1layer = reshape(w1_s_1layer.',[],1); 

                w2_s_1layer = reshape(w2_1layer, N2,N1).'; 
                w2_s_1layer = kron(w2_s_1layer,ones(O1,O2));
                wt2_1layer = reshape(w2_s_1layer.',[],1);

               
%% matrix with layer 1 in 2 layer.
                w1_2layer = w_2layer(1:numel(w_2layer)/2); 
                w2_2layer = w_2layer(numel(w_2layer)/2+1:end); 
               

                w1_s_2layer = reshape(w1_2layer, N2,N1).'; 
                w1_s_2layer = kron(w1_s_2layer,ones(O1,O2)); 
                wt1_2layer = reshape(w1_s_2layer.',[],1); 

                w2_s_2layer = reshape(w2_2layer, N2,N1).'; 
                w2_s_2layer = kron(w2_s_2layer,ones(O1,O2));
                wt2_2layer = reshape(w2_s_2layer.',[],1);

                
%% figure 1
                hFig = figure(1);
                set(gcf,'color','w');

                subplot(4,2,1); 
                pattern(txarray,fc,[-180:180],[-90:90],...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt1_1layer + wt1_2layer));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);

                subplot(4,2,2); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt2_1layer + wt2_2layer));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
               
                
                %% 
                hFig = figure(2);
                
                AzRange = -180:1:180;
                ElRange = -90:1:90;
                
              
                % Plot Array Factor - Azimuth
%                 subplot(2,2,1);
%                 pattern(txarray,fc,AzRange,0,...
%                     'PropagationSpeed',c,...
%                     'CoordinateSystem','polar',...
%                     'Type','powerdB',...
%                     'Weights',wt1_1layer);
                
                az11 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1_1layer);
                
                az12 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1_2layer);
                
                az21 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2_1layer);
                
                az22 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2_2layer);
                
                
                
               
                
                subplot(4,4,1);
                clear plot
                plot(AzRange,az11,"b",AzRange,az12,"r");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,3);
                clear plot
                plot(AzRange,az21,"b",AzRange,az22,"r");
                axis ([-100 100 -50 0]);
                grid on;
                
               
                % Plot Array Factor - Elevation
%                 subplot(2,2,3);
%                 pattern(txarray,fc,0,ElRange,...
%                     'PropagationSpeed',c,...
%                     'CoordinateSystem','polar',...
%                     'Type','powerdB',...
%                     'Weights',wt1_1layer);
                
                el11 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1_1layer);
                
                el12 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1_2layer);
                
                el21 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2_1layer);
                
                el22 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2_2layer);
                
               
                subplot(4,4,2);
                plot(ElRange,el11,"b",ElRange,el12,"r");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,4);
                plot(ElRange,el21,"b",ElRange,el22,"r");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,6);
                plot(ElRange,el31,"b",ElRange,el32,"r");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,8);
                plot(ElRange,el41,"b",ElRange,el42,"r");
                axis ([-100 100 -50 0]);
                grid on;
%                 
%                 % Plot 3D graph
%                 hFig = figure(3);
%                 
%                 subplot(2,2,[1 3]); 
%                 pattern(txarray,fc,[-180:180],[-90:90],...
%                     'PropagationSpeed',c,...
%                     'CoordinateSystem','polar',...
%                     'Type','powerdB',...
%                     'Weights',wt1_1layer);
%                 tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
%                 title(tStr);

                pause(0.05);

            
