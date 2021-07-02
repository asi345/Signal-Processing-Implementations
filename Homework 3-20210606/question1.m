peppers = imread('peppers', 'png');
fruits = imread('fruits', 'png');

binpep = dec2bin(peppers, 8);
binfru = dec2bin(fruits, 8);

binfru(:, 6:8) = binpep(:, 1:3);
            
watermarked3 = uint8(reshape(bin2dec(binfru), [512,512,3])); 

sfru = double(fruits);
swater3 = double(watermarked3);
norm1 = norm(sfru(:,:,1) - swater3(:,:,1));
norm2 = norm(sfru(:,:,2) - swater3(:,:,2));
norm3 = norm(sfru(:,:,3) - swater3(:,:,3));

avg3 = (norm1 + norm2 + norm3) / 3;

figure;
subplot(1,2,1)
imshow(watermarked3)
title('Watermarked fruit with 3 LSBs');

watermark3 = mod(watermarked3, 8) * 32;
subplot(1,2,2)
imshow(watermark3)
title('Watermark image after extraction with 3 MSBs');

binfru(:, 3:8) = binpep(:, 1:6);

watermarked6 = uint8(reshape(bin2dec(binfru), [512,512,3])); 

swater6 = double(watermarked6);
norm1 = norm(sfru(:,:,1) - swater6(:,:,1));
norm2 = norm(sfru(:,:,2) - swater6(:,:,2));
norm3 = norm(sfru(:,:,3) - swater6(:,:,3));

avg6 = (norm1 + norm2 + norm3) / 3;

figure;
subplot(1,2,1)
imshow(watermarked6)
title('Watermarked fruit with 6 LSBs');

watermark6 = mod(watermarked6, 64) * 4;
subplot(1,2,2)
imshow(watermark6)
title('Watermark image after extraction with 6 MSBs');