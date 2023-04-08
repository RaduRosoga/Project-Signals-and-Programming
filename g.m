function y=g(t)
y = zeros(1,length(t));
thr = 0.00001;
for i=1:length(t)
 if (t(i) - thr > 3) && (t(i) + thr < 8)
 y(i) = t(i)-5;
 end
end