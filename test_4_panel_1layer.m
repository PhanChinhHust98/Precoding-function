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

Ng = 4; % Number of sub-array
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
i142 = 1;
i143 = 1;
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
% for i11 = 1:1:15

%               w = codebook(codebookType, L, codebookMode, i11, i12, i13, i2,...
%                     N1, N2, O1, O2);
        w = Four_Panel_1_Layer_Mode_1(i11,i12,i141,i142,i143,i2,Ng,N1,N2,O1,O2);
                w_1layer = w(:,1);
                
%% matrix with layer 1
                w1_1layer = w_1layer(1:numel(w_1layer)/8); 
                w2_1layer = w_1layer(numel(w_1layer)/8+1:numel(w_1layer)*(2/8)); 
                w3_1layer = w_1layer(numel(w_1layer)*(2/8)+1:numel(w_1layer)*(3/8));
                w4_1layer = w_1layer(numel(w_1layer)*(3/8)+1:numel(w_1layer)*(4/8));
                w5_1layer = w_1layer(numel(w_1layer)*(4/8)+1:numel(w_1layer)*(5/8));
                w6_1layer = w_1layer(numel(w_1layer)*(5/8)+1:numel(w_1layer)*(6/8));
                w7_1layer = w_1layer(numel(w_1layer)*(6/8)+1:numel(w_1layer)*(7/8));
                w8_1layer = w_1layer(numel(w_1layer)*(7/8)+1:end);
                

                w1_s_1layer = reshape(w1_1layer, N2,N1).'; 
                w1_s_1layer = kron(w1_s_1layer,ones(O1,O2)); 
                wt1_1layer = reshape(w1_s_1layer.',[],1); 

                w2_s_1layer = reshape(w2_1layer, N2,N1).'; 
                w2_s_1layer = kron(w2_s_1layer,ones(O1,O2));
                wt2_1layer = reshape(w2_s_1layer.',[],1);

                w3_s_1layer = reshape(w3_1layer, N2,N1).'; 
                w3_s_1layer = kron(w3_s_1layer,ones(O1,O2));
                wt3_1layer = reshape(w3_s_1layer.',[],1);
                
                w4_s_1layer = reshape(w4_1layer, N2,N1).'; 
                w4_s_1layer = kron(w4_s_1layer,ones(O1,O2));
                wt4_1layer = reshape(w4_s_1layer.',[],1);
                
                w5_s_1layer = reshape(w5_1layer, N2,N1).'; 
                w5_s_1layer = kron(w5_s_1layer,ones(O1,O2));
                wt5_1layer = reshape(w5_s_1layer.',[],1);
                
                w6_s_1layer = reshape(w6_1layer, N2,N1).'; 
                w6_s_1layer = kron(w6_s_1layer,ones(O1,O2));
                wt6_1layer = reshape(w6_s_1layer.',[],1);
                
                w7_s_1layer = reshape(w7_1layer, N2,N1).'; 
                w7_s_1layer = kron(w7_s_1layer,ones(O1,O2));
                wt7_1layer = reshape(w7_s_1layer.',[],1);
                
                w8_s_1layer = reshape(w8_1layer, N2,N1).'; 
                w8_s_1layer = kron(w8_s_1layer,ones(O1,O2));
                wt8_1layer = reshape(w8_s_1layer.',[],1);
                

                
%% figure 3D
                hFig = figure(1);
                set(gcf,'color','w');

                subplot(4,2,1); 
                pattern(txarray,fc,[-180:180],[-90:90],...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt1_1layer ));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);

                subplot(4,2,2); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt2_1layer));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,3); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt3_1layer ));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,4); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt4_1layer ));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,5); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt5_1layer ));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,6); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt6_1layer ));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,7); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt7_1layer));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                subplot(4,2,8); % o thu 2
                pattern(txarray,fc,[-180:180],[-90:90],...  
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',(wt8_1layer ));
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                
                
                %% figure 2D
                hFig = figure(2);
                
                AzRange = -180:1:180;
                ElRange = -90:1:90;
                
              
                % Plot Array Factor - Azimuth
                subplot(2,2,1);
%                 pattern(txarray,fc,AzRange,0,...
%                     'PropagationSpeed',c,...
%                     'CoordinateSystem','polar',...
%                     'Type','powerdB',...
%                     'Weights',(wt1_1layer));
             
                az11 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1_1layer);
                
                az21 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2_1layer);

                
                az31 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt3_1layer);

                
                az41 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt4_1layer);
                
                az51 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt5_1layer);
                
                az61 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt6_1layer);
                
                az71 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt7_1layer);
                
                az81 = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt8_1layer);
                
                subplot(4,4,1);
                clear plot
                plot(AzRange,az11,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,3);
                clear plot
                plot(AzRange,az21,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,5);
                clear plot
                plot(AzRange,az31,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,7);
                clear plot
                plot(AzRange,az41,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,9);
                clear plot
                plot(AzRange,az51,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,11);
                clear plot
                plot(AzRange,az61,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,13);
                clear plot
                plot(AzRange,az71,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,15);
                clear plot
                plot(AzRange,az81,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                % Plot Array Factor - Elevation
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
                
                el21 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2_1layer);
                
                el31 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt3_1layer);
                
                el41 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt4_1layer);
                
                el51 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt5_1layer);
                
                el61 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt6_1layer);
                
                el71 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt7_1layer);

                el81 = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt8_1layer);
                
                subplot(4,4,2);
                plot(ElRange,el11,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,4);
                plot(ElRange,el21,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,6);
                plot(ElRange,el31,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,8);
                plot(ElRange,el41,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,10);
                plot(ElRange,el51,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,12);
                plot(ElRange,el61,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,14);
                plot(ElRange,el71,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
                subplot(4,4,16);
                plot(ElRange,el81,"b");
                axis ([-100 100 -50 0]);
                grid on;
                
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

            
