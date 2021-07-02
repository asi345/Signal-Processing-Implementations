% sampling frequency
fs = 100;
% values in the x axis of the plot
t = -10:1/fs:10-1/fs;
% original signal
x = sawtooth(2*pi*0.1*t+pi);

x3 = fourier(t, 3);
x5 = fourier(t, 5);
x15 = fourier(t, 15);
plot(t, x);
hold on
plot(t, x3);
plot(t, x5);
plot(t, x15);
legend("original", "sum of first 3 harmonics", "sum of first 5 harmonics", "sum of first 15 harmonics");
xlabel("time");
ylabel("amplitude");
title("Signal and Harmonics Sum");

% Calculates a_k for given k for our fourier approximation
function a_k = fcoeff(k)
    a_k = 1j / (pi * k);
end

% Calculates the complex exponential part for given k for our fourier approximation
function ejwkt = compexp(t, k)
    ejwkt = exp(1j * 2 * pi * k * t / 10);
end

% Calculates the fourier approximation with using 2 * N + 1 terms.
% Therefore, the loop variable k ranges from -N to N, inclusively. The
% approximation values are written into the array xN.
function xN = fourier(t, N)
    
    % Initializes the Fourier approximation array with DC value in each entry
    xN = zeros(1, length(t));

    for k = 1:N
        % Determines a_k for k and -k
        m = mod(k, 2);
        a_kpos = fcoeff(k);
        a_kneg = fcoeff(-k);
        if m == 1
            a_kpos = -a_kpos;
            a_kneg = -a_kneg;
        end

        % Determines the complex exponential part for k and -k
        phapos = compexp(t, k);
        phaneg = compexp(t, -k);

        xN = xN + a_kpos * phapos + a_kneg * phaneg;
    end
end