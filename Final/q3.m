peppers = imread('peppers', 'png');
fruits = imread('fruits', 'png');

gpep = double(rgb2gray(peppers));
gfru = double(rgb2gray(fruits));

dctpep = dct2(gpep);
dctfru = dct2(gfru);

figure;

subplot(2,2,1)
imshow(dctfru, colormap(parula)), colorbar
title('DCT of fruits');

subplot(2,2,2)
imshow(dctpep, colormap(parula)), colorbar
title('DCT of peppers');

dctwater = dctfru;

for row=1:400
    dctwater(512-row+1, 112+row:512) = flip(dctpep(row, 1:(400-row+1)));
end

subplot(2,2,3)
imshow(dctwater, colormap(parula)), colorbar;
title('DCT of watermarked fruit');

subplot(2,2,4)
imshow(uint8(idct2(dctwater)))
title('Watermarked fruit without scaling');


dctwater2 = dctfru;
maxer = max(dctfru, [], 'all');

for row=1:400
    dctwater2(512-row+1, 112+row:512) = flip(dctpep(row, 1:(400-row+1))) ./ maxer;
end

figure;

subplot(1,2,1)
imshow(dctwater2, colormap(parula)), colorbar;
title('DCT of watermarked fruit after scaling');

subplot(1,2,2)
imshow(uint8(idct2(dctwater2)))
title('Watermarked fruit with scaling');

% reconstruct

dctpep2 = zeros(size(dctpep));

for row=1:400
    dctpep2(row, 1:400-row+1) = flip(dctwater2(512-row+1, 112+row:512)) .* maxer;
end

figure;

subplot(1,2,1)
imshow(dctpep2, colormap(parula)), colorbar;
title('DCT of watermark peppers after scaling');

conspep = uint8(idct2(dctpep2));

subplot(1,2,2)
imshow(conspep)
title('Watermark peppers with scaling');

resnorm = norm(gpep - double(idct2(dctpep2)));


