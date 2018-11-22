%forestFire 1

timeSteps = 10000;
nrFires = 1000;
areaSize = 128;
fireSizeVec = [];
forest = zeros(areaSize, areaSize);
plotForest = true;

f = 0.2;
p = 0.1;

if plotForest
    subplot(1,2,1);
    map = [1 1 1; 1 0 0; 0 1 0];
    colormap(map);
    plot1 = imagesc('CData',forest);
    xlim([0 areaSize]);
    ylim([0 areaSize]);
    pbaspect([1 1 1]); 
end

t = 0;
while(size(fireSizeVec, 1) < nrFires)
    t = t+1;
    
    forest = TreeGrowth(forest, p);
    
    if plotForest
        set(plot1, 'CData', forest);
        drawnow
    end
    
    forest = BurnDown(forest, f);
    
    if(sum(forest(:) == 1) ~= 0)
        fireSizeVec = [fireSizeVec; sum(forest(:) == 1)];
        
        if plotForest
            set(plot1, 'CData', forest);
            drawnow
        end
    end
    forest(forest == 1) = 0;
    
end

fireSizeVec = fireSizeVec./areaSize^2;
fireSizeVec = fliplr(sort(fireSizeVec));

xValues = fliplr((1:nrFires)/nrFires);

subplot(1,2,2);
loglog(xValues,fireSizeVec,'.k', 'MarkerSize',2);
axis equal
pbaspect([1 1 1]); 
