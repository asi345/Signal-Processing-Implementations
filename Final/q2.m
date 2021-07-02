fruits = imread('textembeddedfruits', 'png');

% extract text

bits = string((mod(fruits(443:512, 506:512, 3), 4) - mod(fruits(443:512, 506:512, 3), 2)) ./ 2);
rowbits = strcat(bits(:,1),bits(:,2),bits(:,3),bits(:,4),bits(:,5),bits(:,6),bits(:,7));
asciis2 = bin2dec(char(rowbits));
text2 = char(asciis2);

fileID = fopen('result.txt', 'w');
fprintf(fileID, text2);