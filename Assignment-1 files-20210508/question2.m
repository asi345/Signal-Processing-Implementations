% Reads the audio file with x being the sample values and fs is the sample
% frequency
[x, fs] = audioread("faultyphone.wav");

% Plots the given signal to see what is wrong
subplot(2,3,1)
plot(x)
xlabel('Time')
ylabel('Signal')
title('Input signal');

n = length(x);

% Takes the signal to the frequency domain
x0 = fftshift(fft(x));
% Initializes a frequency array with normalized values according to fs
f0 = (-n/2:n/2-1)*(fs/n);

% Plots the magnitude-frequency graph of the given signal in frequency
% domain
subplot(2,3,2)
plot(f0,abs(x0)/n)
xlabel('Frequency')
ylabel('Amplitude');
title('Input signal');

% Plots the phase-frequency graph of the given signal in frequency
% domain
anglex = angle(x0);
subplot(2,3,3)
plot(f0,anglex/pi)
xlabel('Frequency')
ylabel('Phase');
title('Input signal');

% Initializes our filter H(e^(jw)) with 1s
freqfilt = ones(n,1);

% Finds the indices of the frequencies in our signal in which the magnitude
% for that frequency is very high relative to other magnitudes. This high
% magnitude causes us to hear loud "beep" noise.
indices = find(abs(x0)/n > 0.01);

% Makes the indices of the filter determined above 0. At the frequency f,
% the corresponding index in given signal x will be multiplied by
% H(e^(j2pif), which will correspond to the same index in our filter.
% Therefore, the frequency terms with high magnitude in the signal will be
% multiplied by 0 in the filter, vanishing them. This is true since in the
% frequency domain, convolution is converted to multiplication and thus
% y[i] = H(e^(j2pif))x[i] = freqfilt[i]x[i]
freqfilt(indices) = 0;

% Applies oour filter to the input signal in frequency domain and gets the
% output signal y0 in the frequency domain.
y0 = x0 .* freqfilt;

% Plots the magnitude-frequency graph of the output signal in frequency
% domain
subplot(2,3,5)
plot(f0,abs(y0)/n)
xlabel('Frequency')
ylabel('Amplitude');
title('Output signal');

% Takes the output signal to the time domain
y = ifft(ifftshift(y0));

% Plots the output signal in the time domain
subplot(2,3,4)
plot(y)
xlabel('Time')
ylabel('Signal');
title('Output signal');

% Plots the phase-frequency graph of the output signal in frequency
% domain
angley = angle(y0);
subplot(2,3,6)
plot(f0,angley/pi)
xlabel('Frequency')
ylabel('Phase');
title('Output signal');

% Writes the output signal to the audio file with y being the sample values
% and fs is the sample frequency
audiowrite("phone.wav", y, fs);