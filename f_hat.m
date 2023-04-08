function y=f_hat(t)
y = zeros(1,length(t));
thr = 0.00001;
for i=1:length(t)
 if (t(i) - thr > 1) && (t(i) + thr < 5)
 y(i) = -t(i)*t(i)+6*t(i)-6;
 end
end