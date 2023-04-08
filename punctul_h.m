%subpunctul h

close all;
clear;
clc;

step =0.1;
tau=-14:step:16;
figure(1);
subplot(2,1,1);
plot(tau,f(tau-3));
axis([min(tau), max(tau), -1, 4]);
xlabel('Time \tau [s]'), ylabel('Amplitude'), title('f3(\tau)');
grid;
subplot(2,1,2);
plot(tau,g(tau));
axis([min(tau), max(tau), -3, 4]);
xlabel('Time \tau [s]'), ylabel('Amplitude'), title('g(\tau)');
grid;

tmin=0;
tmax=10;
t = tmin:step:tmax;
for index_t=1:length(t)
 figure(2);
 subplot(211);
 plot(tau,f(tau-3),'b');
 xlabel('Time \tau [s]');
 ylabel('Amplitude');
 title('Signals f3(\tau), g(\tau+t) and their product');
 hold on
 plot(tau,g(tau + t(index_t)),'r');
 prod = f(tau-3).*g(tau + t(index_t));
 stem(tau, prod,'g');
 hold off
 % We use axis in order to specify the limits of the figure
 axis([min(tau),max(tau),-10,12]);
 legend('f3(\tau)', 'g(\tau+t)', 'f3(\tau)g(\tau+t)');
 grid;

 % We determine the convolution at moment t
 cnv(index_t) = integral(@(tau)f(tau-3).*g(tau + t(index_t)),-10,10);%
 subplot(212);
 plot(t(1:length(cnv)),cnv);
 xlabel('Time t [s]');
 ylabel('Amplitude');
 title('The correlation (f 3 $\hat{*}$g)(t)','Interpreter','latex');
 axis([min(tau),max(tau),-12,19]);
 grid;
 pause(0.1);
end

