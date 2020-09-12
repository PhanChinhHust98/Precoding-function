clear all;
clc;

% Codebook Type enumerations:
% codebookType
% 0 - Type I - Single Panel
% 1 - Type I - Multi Panel
% 2 - Type II - Codebook Type 2
% 3 - Type II - Port Selection

% Ng - Number of panel
% N1 - Number of horizontal antenna element (azimuth)
% N2 - Number of vertical antenna element (elevation)
% O1 - Oversampling of horizontal antenna element (azimuth)
% O2 - Oversampling of vertical antenna element (elevation)

% L - Number of layer

% codebookMode - codebook Mode
% codebookType - codebook Type

% i11 - Steer beams in horizontal
% i12 - Steer beams in vertical

% Configurations

c = 3e8;        % propagation speed
fc = 3.5e9;     % carrier frequency
lambda = c/fc;	% wavelength

Ng = 1; % Number of sub-array
N1 = 4; % Number of horizontal antenna elements
N2 = 4; % Number of vertical antenna elements
%N2 = 2;
O1 = 4; % Number of horizontal oversampling factor
O2 = 4; % Number of vertical oversampling factor
   
L = 1;

codebookMode = 1;
codebookType = 0;   % Type I - Single Panel, = 1:multiple


% i11 = 1; % max = 15, case 1 = 0; case 2 = 1;
% i12 = 1; % case 1 = 0; case 2 = 1
i13 = 0;
% i2 = 0;
i3 = 2;
%i141 = 2;

plot = 1;
% precoding matrix: w
% w = codebook(codebookType, L, codebookMode, i11, i12, i13, i2, N1, N2, O1, O2);

%% Set up beam
antennaElement = phased.CrossedDipoleAntennaElement; %creates a crossed-dipole antenna with default property values.
%    phased.CrossedDipoleAntennaElement:
%           FrequencyRange: [0 1.0000e+20]
%           RotationAngle: 0
%           Polarization: 'RHCP' : Linear
%                           '0'  : Scalar between -45° and +45°

if N2 ~= 1 % array in vertical size
    txarray = phased.URA('Size',[N1*O1 N2*O2],'ElementSpacing',[lambda/2 lambda/2],...
        'Element',antennaElement);
elseif N2 == 1 
    txarray = phased.ULA('NumElements',N1*N2*O1*O2,'ElementSpacing',lambda/2,...
        'Element',antennaElement); 
    
%     Element — Individual antenna elements or linear arrays
%     NumElements — Number of antenna elements in array
%     ElementSpacing' — Spacing between antenna elements
end
%txarray.Element.BackBaffled = true;
pos = getElementPosition(txarray); 

if plot == 1

while 1
    for i11 = 5 %:N1*O1/2-1
        for i12 = 5 %:N2*O2/2-1
            for i2 = 0 %:15
                w = codebook(codebookType, L, codebookMode, i11, i12, i13, i2,...
                     N1, N2, O1, O2);
                %w = Two_Panel_1_Layer_Mode_1_Case_1(i11,i12,i141,i2,Ng,N1,N2,O1,O2)

                w1 = w(1:numel(w)/2);
                w2 = w(numel(w)/2+1:end);

                w1_s = reshape(w1, N2,N1).';
                w1_s = kron(w1_s,ones(O1,O2));
                wt1 = reshape(w1_s.',[],1);

                w2_s = reshape(w2, N2,N1).';
                w2_s = kron(w2_s,ones(O1,O2));
                wt2 = reshape(w2_s.',[],1);

                hFig = figure(1);
                set(gcf,'color','w');

                subplot(L,2,1);
                pattern(txarray,fc,[-180:180],[-90:90],...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);

                subplot(L,2,2);
                pattern(txarray,fc,[-180:180],[-90:90],...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt2);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);
                
                hFig = figure(2);
                
                AzRange = -180:1:180;
                ElRange = -90:1:90;
                
                % Plot Array Factor - Azimuth
                subplot(2,2,2);
                az = pattern(txarray,fc,AzRange,0,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                plot(az);
                axis ([-100 100 -20 0]);
                grid on;
                
                % Plot Array Factor - Elevation
                el = pattern(txarray,fc,0,ElRange,...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                plot(ElRange,el);
                axis ([-100 100 -20 0]);
                grid on;
                
                % Plot 3D graph
                subplot(2,2,[1 3]);
                pattern(txarray,fc,[-180:180],[-90:90],...
                    'PropagationSpeed',c,...
                    'CoordinateSystem','polar',...
                    'Type','powerdB',...
                    'Weights',wt1);
                tStr = sprintf('i_{11} = %d, i_{12} = %d, i_2 = %d',i11,i12,i2);
                title(tStr);

                pause(0.05);

            end
        end
    end
end

end
