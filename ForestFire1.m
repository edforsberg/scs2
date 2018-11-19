%forestFire 1

timeSteps = 10000;
nrFires = 1000;
areaSize = 128;
fireSizeVec = [];
area = zeros(areaSize, areaSize);
plotForest = false;

f = 0.03;
p = 0.001;

if plotForest
    subplot(1,2,1);
    map = [1 1 1; 1 0 0; 0 1 0];
    colormap(map);
    plot1 = imagesc('CData',area);
    xlim([0 areaSize]);
    ylim([0 areaSize]);
end

t = 0;
while(size(fireSizeVec, 1) < nrFires)
    t = t+1;
    
    area = TreeGrowth(area, p);
    
    if plotForest
        set(plot1, 'CData', area);
        drawnow
    end
    
    area = BurnDown(area, f);
    
    if(sum(area(:) == 1) ~= 0)
        fireSizeVec = [fireSizeVec; sum(area(:) == 1)];
        
        if plotForest
            set(plot1, 'CData', area);
            drawnow
        end
    end
    area(area == 1) = 0;
    
end

fireSizeVec = fireSizeVec./areaSize^2;
fireSizeVec = fliplr(sort(fireSizeVec));

xValues = fliplr((1:nrFires)/nrFires);

subplot(1,2,2);
loglog(xValues,fireSizeVec,'.k', 'MarkerSize',2);
axis equal
pbaspect([1 1 1]); 
