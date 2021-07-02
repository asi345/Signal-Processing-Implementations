t = 0:0.01:2;
a = 4 * pi;
b = 2 * pi;
x = cos(a * t.^2 + b * t);
fi = 2 * a * t + b;

figure;
plot(t, fi);

figure;
subplot(3,1,2)
plot(t,x);

subplot(3,1,1)
plot(t, cos(2 * pi * 4 * t));

subplot(3,1,3)
plot(t, cos(2 * pi * 8 * t));