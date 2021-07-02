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

% Finds the indices of the frequencies in our signal in which the magnitude
% for that frequency is very high relative to other magnitudes. This high
% magnitude causes us to hear loud "beep" noise.
indices = find(abs(x0)/n > 0.01);


z1 = exp(1j * 2 * pi * f0(indices(1)));
z2 = exp(1j * 2 * pi * f0(indices(2)));
z = exp(1j * 2 * pi * f0);

%hz = (1 - z1 * exp(-1j * 2 * pi * f0)) .* (1 - z2 * exp(-1j * 2 * pi * f0));
hz = 1 - 2 .* cos(2 * pi * f0(indices(1))) .* z.^(-1) + z.^(-2);

val = cos(2 * pi * f0(indices(1)));

y = [x; 0; 0] - 2 * val * [0; x; 0] + [0; 0; x];

% Applies oour filter to the input signal in frequency domain and gets the
% output signal y0 in the frequency domain.
% y0 = x0 .* transpose(hz);

% Plots the magnitude-frequency graph of the output signal in frequency
% domain
subplot(2,3,5)
%plot(f0,abs(y0)/n)
xlabel('Frequency')
ylabel('Amplitude');
title('Output signal');

% Takes the output signal to the time domain
%y = ifft(ifftshift(y0));

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
%plot(f0,angley/pi)
xlabel('Frequency')
ylabel('Phase');
title('Output signal');

% Writes the output signal to the audio file with y being the sample values
% and fs is the sample frequency
audiowrite("phone.wav", y, fs);