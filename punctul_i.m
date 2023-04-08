%punctul i

close all;
clear;
clc;

step =0.1;
tau=-14:step:16;
figure(1);
subplot(2,1,1);
plot(tau,f_hat(tau));
axis([min(tau), max(tau), -1, 4]);
xlabel('Time \tau [s]'), ylabel('Amplitude'), title('f hat(\tau)');
grid;
subplot(2,1,2);
plot(tau,g(tau+5));
axis([min(tau), max(tau), -3, 4]);
xlabel('Time \tau [s]'), ylabel('Amplitude'), title('g(\tau+5)');
grid;

tmin=-3;
tmax=8;
t = tmin:step:tmax;
for index_t=1:length(t)
 figure(2);
 subplot(211);
 plot(tau,f(tau),'b');
 xlabel('Time \tau [s]');
 ylabel('Amplitude');
 title('Signals f hat(\tau), g-5(\tau+t) and their product');
 hold on
 plot(tau,g(tau + t(index_t)+5),'r');
 prod = f(tau).*g(tau + t(index_t)+5);
 stem(tau, prod,'g');
 hold off
 % We use axis in order to specify the limits of the figure
 axis([min(tau),max(tau),-10,12]);
 legend('f(\tau)', 'g(\tau+t+5)', 'f(\tau)g(\tau+t)');
 grid;

 % We determine the convolution at moment t
 cnv(index_t) = integral(@(tau)f(tau).*g(tau + t(index_t)+5),-10,10);%
 subplot(212);
 plot(t(1:length(cnv)),cnv);
 xlabel('Time t [s]');
 ylabel('Amplitude');
 title('The convolution of f hat*g-5(t)');
 axis([min(tau),max(tau),-12,19]);
 grid;
 pause(0.1);
end

