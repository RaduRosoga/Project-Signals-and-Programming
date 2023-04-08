%punctul f

close all;
clear;
clc;

step =0.1;
tau=-14:step:16;
figure(1);
subplot(2,1,1);
plot(tau,f(tau));
axis([min(tau), max(tau), -1, 4]);
xlabel('Time \tau [s]'), ylabel('Amplitude'), title('f(\tau)');
grid;
subplot(2,1,2);
plot(tau,g(tau+3));
axis([min(tau), max(tau), -3, 4]);
xlabel('Time \tau [s]'), ylabel('Amplitude'), title('g-3(\tau)');
grid;

tmin=-7;
tmax=6;
t = tmin:step:tmax;
for index_t=1:length(t)
 figure(2);
 subplot(211);
 plot(tau,f(tau),'b');
 xlabel('Time \tau [s]');
 ylabel('Amplitude');
 title('Signals f(\tau), g-3(t-\tau) and their product');
 hold on
 plot(tau,g(t(index_t)-tau+3),'r');
 prod = f(tau).*g(t(index_t)-tau+3);
 stem(tau, prod,'g');
 hold off
 % We use axis in order to specify the limits of the figure
 axis([min(tau),max(tau),-10,12]);
 legend('f(\tau)', 'g -3(t-\tau)', 'f(\tau)g-3(t-\tau)');
 grid;

 % We determine the convolution at moment t
 cnv(index_t) = integral(@(tau)f(tau).*g(t(index_t)-tau+3),-10,10);%
 subplot(212);
 plot(t(1:length(cnv)),cnv);
 xlabel('Time t [s]');
 ylabel('Amplitude');
 title('The convolution (f*g -3 )(t)','latex');
 axis([min(tau),max(tau),-12,19]);
 grid;
 pause(0.1);
end

