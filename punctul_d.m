%punctul d

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
plot(tau,g_hat(tau));
axis([min(tau), max(tau), -3, 4]);
xlabel('Time \tau [s]'), ylabel('Amplitude'), title('g_hat(\tau)');
grid;

tmin=2;
tmax=15;
t = tmin:step:tmax;
for index_t=1:length(t)
 figure(2);
 subplot(211);
 plot(tau,g(tau),'b');
 xlabel('Time \tau [s]');
 ylabel('Amplitude');
 title('Signals g(\tau), f(\tau+t) and their product');
 hold on
 plot(tau,f(tau - t(index_t)),'r');
 prod = g(tau).*f(tau + t(index_t));
 stem(tau, prod,'g');
 hold off
 % We use axis in order to specify the limits of the figure
 axis([min(tau),max(tau),-10,12]);
 legend('g(\tau)', 'f(\tau+t)', 'g(\tau)f(\tau+t)');
 grid;

 % We determine the convolution at moment t
 cnv(index_t) = integral(@(tau)g(tau).*f(tau - t(index_t)),-10,10);%
 subplot(212);
 plot(t(1:length(cnv)),cnv);
 xlabel('Time t [s]');
 ylabel('Amplitude');
 title('Convolution (f*g_hat)(t)');
 axis([min(tau),max(tau),-12,19]);
 grid;
 pause(0.1);
end

