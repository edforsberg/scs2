clc 

f = 0.1;
p = 0.01;

vec8 = csvread('vec8'); 
vec16 = csvread('vec16'); 
vec32 = csvread('vec32'); 
vec64 = csvread('vec64'); 
vec128 = csvread('vec128'); 
vec256 = csvread('vec256'); 
vec512 = csvread('vec512');

vec = [vec8 vec16 vec32 vec64 vec128 vec256 vec512]; 

%%
tauVec = []; 
nVec = []; 
for i = 1:7
    
    fireSizeVec = vec(:,2*i-1);
    rank = vec(:,2*i);
    p = polyfit(log(fireSizeVec(500:end)),log(rank(500:end)), 1); 
    tau = 1-p(1); 
    
    tauVec = [tauVec; tau]; 
    
    nVec = [nVec; 1/2^(2+i)]; 
    
end

p = polyfit(nVec,tauVec, 1); 
xData = [min(nVec) max(nVec)]; 
yData = p(1).*xData+p(2); 

plot(xData, yData);
hold on 
scatter(nVec, tauVec);
title('f = 0.1, p= 0.01, nrFires = 1E3'); 
xlabel('1/laticeSize'); 
ylabel('tau'); 
    