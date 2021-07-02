baboon = imread('baboon', 'png');
wfruits = imread('watermarkedfruits', 'png');

wbaboon = mod(wfruits, 16) * 16;
          
sfru = double(baboon);
swater3 = double(wbaboon);
norm1 = norm(sfru(:,:,1) - swater3(:,:,1));
norm2 = norm(sfru(:,:,2) - swater3(:,:,2));
norm3 = norm(sfru(:,:,3) - swater3(:,:,3));

avg3 = (norm1 + norm2 + norm3) / 3;