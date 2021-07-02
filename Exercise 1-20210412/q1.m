% Problem 1

t = -2:0.01:2;

y1 = sin(2*pi*t);
y2 = sin(2*pi*10*t);
y3 = 10*sin(2*pi*t);
y4 = sin(2*pi*t);
y5 = sin(2*pi*(t-0.5));
y6 = 10*sin(2*pi*10*t);
y7 = t.*sin(2*pi*t);
y8 = sin(2*pi*t)./t;
y9 = y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8;

ys = [y1; y2; y3; y4; y5; y6; y7; y8; y9];

figure;

for n = 1:9
    subplot(5, 2, n)
    plot(t, ys(n, :));
end

% Problem 2

z = randn(1, 401);
z = z.*0.1;

y10 = z;
y11 = z+t;
y12 = z+y1;
y13 = z.*y1;
y14 = t.*sin(2*pi*z);
y15 = sin(2*pi*(t+z));
y16 = z.*y2;
y17 = sin(2*pi*(t+10*z));
y18 = y1./z;
y19 = y11 + y12 + y13 + y14 + y15 + y16 + y17 + y18;

ys2 = [y10; y11; y12; y13; y14; y15; y16; y17; y18; y19];

figure;

for n = 1:10
    subplot(5, 2, n)
    plot(t, ys2(n, :));
end

% Problem 3

z = randn(1, 401);
z = z.*0.1;

y20 = z;
y21 = z+t;
y22 = z+y1;
y23 = z.*y1;
y24 = t.*sin(2*pi*z);
y25 = sin(2*pi*(t+z));
y26 = z.*y2;
y27 = sin(2*pi*(t+10*z));
y28 = y1./z;
y29 = y21 + y22 + y23 + y24 + y25 + y26 + y27 + y28;

ys3 = [y20; y21; y22; y23; y24; y25; y26; y27; y28; y29];

figure;

for n = 1:10
    subplot(5, 2, n)
    plot(t, ys3(n, :));
end

% Problem 4

r1 = randn(1, 5000);
r2 = sqrt(8) .* randn(1, 5000);
r3 = sqrt(64) .* randn(1, 5000);
r4 = sqrt(256) .* randn(1, 5000);

rs1 = [r1; r2; r3; r4];

figure;

for n=1:4
    subplot(2, 2, n)
    hist(rs1(n, :));
end

% Problem 5

r6 = sqrt(1) .* randn(1, 5000) + 10;
r7 = sqrt(4) .* randn(1, 5000) + 20;
r8 = sqrt(1) .* randn(1, 5000) - 10;
r9 = sqrt(4) .* randn(1, 5000) - 20;

rs2 = [r6; r7; r8; r9];

figure;

for n=1:4
    subplot(2, 2, n)
    hist(rs2(n, :));
end

% Problem 6

r11 = 8 .* rand(1, 5000) - 4;
r21 = 40 .* rand(1, 5000) - 20;

figure;

subplot(1, 2, 1);
hist(r11);

subplot(1, 2, 2);
hist(r21);

% Problem 7

z = 9 + 6i;
[theta, r] = cart2pol(real(z), imag(z));

[x, y] = pol2cart(theta, r);

% Problem 8

load mysignal.mat

figure;

subplot(2, 2, 1)
plot(t, x)
xlabel('time')
ylabel('signal');

y = fft(x);
n = length(x);

f = (0:n-1)*(fs/n); % 0:fs/n:fs
subplot(2, 2, 2)
plot(f,abs(y)/n)
xlabel('Frequency')
ylabel('Amplitude');

y0 = fftshift(y);
f0 = (-n/2:n/2-1)*(fs/n);

subplot(2, 2, 3)
plot(f0,abs(y0)/n)
xlabel('Frequency')
ylabel('Amplitude');

tol = 1e-6;
y0(abs(y0) < tol) = 0;
angle0 = angle(y0);

subplot(2, 2, 4)

plot(f0,angle0/pi)
xlabel('Frequency')
ylabel('Phase');

% x = 0.85 + 0.85 * e^(j*+-(2*pi*25*t - 0.5*pi)) + 0.85 * e^(j*+-(2*pi*65*t - 0.5*pi))
% + 0.85 * e^+-(j*(2*pi*120*t - 0.5*pi)) = 1.7 * cos(2*pi*25*t - 0.5*pi) + 
% 1.7 * cos(2*pi*65*t - 0.5*pi) + 1.7 * cos(2*pi*120*t - 0.5*pi)

% Problem 9

A = imread('lena', 'png');
G = double(rgb2gray(A));

avg = mean(G, 'all');
dev = std(G, 0, 'all');

[maxer, maxind]= max(G, [], 'all', 'linear');
[miner, minind]= min(G, [], 'all', 'linear');