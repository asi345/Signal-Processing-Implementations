[y,fs] = audioread('la.m4a'); %y=sampled data and Fs is the sampling rate
y1 = y(:,1);
y2 = y(:,2);
Y = fft(y1);
l=length(y1);

Y0 = fftshift(Y);         % shift y values
f0 = (-l/2:l/2-1)*(fs/l); % 0-centered frequency range
power0 = abs(Y0).^2/l;    % 0-centered power

subplot(1,2,1)

plot(f0,abs(Y0)/l)
xlabel('Frequency')
ylabel('Amplitude')
xlim([-5000 5000])

