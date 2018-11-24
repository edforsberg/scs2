%forestFire 1
clf

nrFires = 1000;
areaSize = 512;
fireSizeVec = [];
forest = zeros(areaSize, areaSize);
plotForest = false;
plotGraph = false; 

f = 0.1;
p = 0.01;

if plotForest
    subplot(1,2,1);
    map = [1 1 1; 1 0 0; 0 1 0];
    colormap(map);
    plot1 = imagesc('CData',forest);
    xlim([0 areaSize]);
    ylim([0 areaSize]);
    pbaspect([1 1 1]);
    xlabel('relative fire size');
    ylabel('rank');
    title('f = 0.01, p = 0.1, N = 128');
end

t = 0;
while(size(fireSizeVec, 1) < nrFires)
    t = t+1;
    
    forest = TreeGrowth(forest, p);
    
    if (plotForest)
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
fireSizeVec = flipud(sort(fireSizeVec));

yValues = fliplr((1:nrFires)'/nrFires);

if plotGraph
    subplot(1,2,2);
    loglog(fireSizeVec,yValues,'.k', 'MarkerSize',2);
    axis equal
    pbaspect([1 1 1]);
end

vec512 = [fireSizeVec, yValues]; 
csvwrite('vec512', vec512); 
