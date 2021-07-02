x = sqrt(2)*randn(1,10000)+12;
[C, LAGS] = xcorr(x, -x);
an = C(5000);
figure;
subplot(1,2,1)
plot(x);
subplot(1,2,2)
plot(LAGS,C);
title('İsmail Ata İnan');