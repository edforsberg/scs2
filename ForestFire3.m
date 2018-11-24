clf
clc

vec2 = csvread('f01p001'); 
vec1 = csvread('f05p002');

fireSizeVec = vec1(:,1);
rank = vec1(:,2); 

p = polyfit(log(fireSizeVec(500:end)),log(rank(500:end)), 1); 

xData = linspace(-10, 2.7, 100); 
yData = xData.*p(1)+p(2); 


loglog(fireSizeVec,rank,'.k','MarkerSize',2);
axis equal
hold on 
% loglog(exp(xData), exp(yData)); 
xlabel('relative fire size');
ylabel('rank'); 
title('f = 0.1, p = 0.01, tao = 1.1488'); 
pbaspect([1 1 1]);
hold on

%%

tau = 1.1488; 

randVec = rand(1000, 1); 

xPowDist = min(fireSizeVec).*(1-randVec).^(-1/(tau-1));


xPowDist = flipud(sort(xPowDist));

loglog(xPowDist, rank,'MarkerSize',2);
legend({'forest data','power law data'},'Location','southwest')


