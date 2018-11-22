%forestFire 1
clear all
clc
clf

nrFires = 100;
areaSize = 128;

fireSizeVec = [];
densityVec = []; 
randFireVec = []; 

forest = zeros(areaSize, areaSize);
plotForest = false;

f = 0.03;
p = 0.001;

t = 0;
while(size(fireSizeVec, 1) < nrFires)
    t = t+1;
    
    forest = TreeGrowth(forest, p);
    
    density = sum(sum(forest == 2))/areaSize^2; 
    
    forest = BurnDown(forest, f);    
    if(sum(forest(:) == 1) ~= 0)
        fireSizeVec = [fireSizeVec; sum(forest(:) == 1)];
        densityVec = [densityVec; density]; 
    end
    forest(forest == 1) = 0;
    
end


for i = 1:numel(densityVec)
    
    randForest = RandomForrest(areaSize, densityVec, i);    
    noFire = true;
    
    while noFire
        randForest = BurnDown(randForest, 1);
        if(sum(randForest(:) == 1) ~= 0)
            noFire = false;
            randFireVec = [randFireVec; sum(randForest(:) == 1)];
        end
    end
end


randFireVec = randFireVec./areaSize^2;
randFireVec = sort(randFireVec); 

fireSizeVec = fireSizeVec./areaSize^2;
fireSizeVec = sort(fireSizeVec);

yValues = fliplr((1:nrFires)./nrFires);

loglog(fireSizeVec,yValues, 'o','MarkerSize',2);
hold on
loglog(randFireVec, yValues, 'o', 'MarkerSize',2);
axis equal
pbaspect([1 1 1]);
