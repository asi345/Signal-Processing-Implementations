text = fileread('text.txt');

asciis = dec2bin(double(char(text)));
asciis = uint8(asciis) - 48;
    
fruits = imread('fruits', 'png');

figure;

subplot(1,2,1)
imshow(fruits);
title('Original image');

target = fruits(1:75, 1:7, 1);
fruits(1:75, 1:7, 1) = mod(target, 128) + 128 .* asciis; %MSB

subplot(1,2,2)
imshow(fruits);
title('Watermarked image');

fruits(1:75, 1:7, 1) = (target - mod(target, 2)) + asciis; %LSB

% extract text

bits = string(mod(fruits(1:75, 1:7, 1), 2));
rowbits = strcat(bits(:,1),bits(:,2),bits(:,3),bits(:,4),bits(:,5),bits(:,6),bits(:,7));
asciis2 = bin2dec(char(rowbits));
text2 = char(asciis2);

fileID = fopen('result.txt', 'w');
fprintf(fileID, text2);