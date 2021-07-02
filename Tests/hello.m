S = 'hello there!';
disp(S);
tau = 1.5 * 24 * 60 * 60;
endofclass = 5 * 24 * 60 * 60;
knowledgeatend = 1 - exp(-endofclass / tau);
disp(['At end of 6.094, i will know ' num2str(knowledgeatend) '% of matlab']);
tVec = linspace(0, endofclass, 10000);
knowledgeVec = 1 - exp(-tVec ./ tau);
index = find(abs(knowledgeVec - 0.5) == min(abs(knowledgeVec - 0.5)));
halftime = tVec(index);

x = linspace(0, 4*pi, 100);
y = sin(x);
plot(x, y);

figure
subplot(2, 3, 4:6);
 
plot(tVec, knowledgeVec);

figure
time = 0:0.001:4*pi;
x = sin(time);
y = cos(time);
z = time;
plot3(x,y,z,'k', 'LineWidth',2);
zlabel('Time');