% Reads the audio file with x being the sample values and fs is the sample
% frequency
[x, fs] = audioread("enginesound.m4a");

% Plots the input engine sound
subplot(1,2,1)
plot(x)
xlabel('Time')
ylabel('Signal')
title('Input Signal of engine');

% Determines the filter coefficients for 50-point time averager
bk = 1/50 * ones(50,1);

% Applies the filter by doing the convolution operation and stores the
% output signal at y
y = conv(bk, x);

% Plots the output signal
subplot(1,2,2)
plot(y)
xlabel('Time')
ylabel('Signal')
title('Output Signal of Averaged Sound');

% Saves the 50-point time averaged sound to the file
audiowrite("averagedengine.wav", y, fs);

% Opens a new figure and plots the spectrogram of the input signal x there
figure;
n = length(x);
spectrogram(x, n, 1, n, fs);