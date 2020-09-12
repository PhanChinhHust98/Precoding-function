theta = -1.0*pi:pi/100:1.0*pi;

phaseShift = exp(-j*2*pi/8);

 

d = 1.1;

 

a_theta = [exp(-j .* 0 .* d .* sin(theta)) ;

           exp(-j .* 1 .* d .* sin(theta));

           exp(-j .* 2 .* d .* sin(theta));

           exp(-j .* 3 .* d .* sin(theta));

           exp(-j .* 4 .* d .* sin(theta));

           exp(-j .* 5 .* d .* sin(theta));

           exp(-j .* 6 .* d .* sin(theta));

           exp(-j .* 7 .* d .* sin(theta))];

 

n = 8;

a_theta =  a_theta([1:n],:);          

a_theta_sum = sum(a_theta);

%s_theta_sum = sum(s_theta);

a_theta_sum_abs = abs(a_theta_sum);

a_theta_sum_abs = a_theta_sum_abs ./ max(a_theta_sum_abs);

a_theta_sum_abs_dB = 10 .* log(a_theta_sum_abs);

 

for i = 1:length(a_theta_sum_abs_dB)

    if a_theta_sum_abs_dB(i) <= -30

        a_theta_sum_abs_dB(i) = -30;

    end;    

end;    

 

 

 

a_theta_sum_abs_dB = a_theta_sum_abs_dB - min(a_theta_sum_abs_dB);

if max(a_theta_sum_abs_dB) != 0

   a_theta_sum_abs_dB = a_theta_sum_abs_dB/max(a_theta_sum_abs_dB);

end;

 

hFig = figure(1,'Position',[300 300 700 600]);

 

subplot(2,2,1);

plot(theta,a_theta_sum_abs);

xlim([-pi pi]);

ylim([0 1]);

tStr = sprintf("d = %0.2f",d);

title(tStr);

 

set(gca,'xtick',[-pi -(3/4)*pi  -pi/2 -pi/4 0 pi/4 pi/2 (3/4)*pi pi]);

set(gca,'xticklabel',{'-pi','-3pi/4','-pi/2' '-pi/4' '0' 'pi/4' 'pi/2','-3pi/4','pi'});

 

subplot(2,2,2);

polar(theta,a_theta_sum_abs,'-r');

t = findall(gcf,'type','text');

%delete(t);

 

 

subplot(2,2,3);plot(theta,10 .* log(a_theta_sum_abs));ylim([-30 1]);

xlim([-pi pi]);

tStr = sprintf("d = %0.2f",d);

title(tStr);

 

set(gca,'xtick',[-pi -(3/4)*pi  -pi/2 -pi/4 0 pi/4 pi/2 (3/4)*pi pi]);

set(gca,'xticklabel',{'-pi','-3pi/4','-pi/2' '-pi/4' '0' 'pi/4' 'pi/2','-3pi/4','pi'});

 

subplot(2,2,4);

polar(theta,a_theta_sum_abs_dB,'-r');

 

t = findall(gcf,'type','text');

 

 