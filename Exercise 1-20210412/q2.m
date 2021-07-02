A = imread('peppers', 'png');
G = double(rgb2gray(A));

avg = mean(G, 'all');
dev = std(G, 0, 'all');

[maxer, maxind]= max(G, [], 'all', 'linear');
[miner, minind]= min(G, [], 'all', 'linear');