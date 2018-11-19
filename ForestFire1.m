%forestFire 1

timeSteps = 1000;
areaSize = 128;

f = 0.01;
p = 0.005;

area = zeros(areaSize, areaSize);
mapTree = [1 1 1; 0 1 0];
mapBurn = [1 1 1; 0 1 0; 1 0 0];
colormap(mapTree);
plot1 = imagesc('CData',area);
xlim([0 areaSize]);
ylim([0 areaSize]);


t = 0;
while(t<timeSteps)
    t = t+1;
    
    area = TreeGrowth(area, p);    
    set(plot1, 'CData', area);
    
    area = BurnDown(area, f);
    
    if(sum(area(:) == 2) ~= 0)
        colormap(mapBurn);
        set(plot1, 'CData', area);
        pause
        colormap(mapTree);
    end
    
    
    
    
    
end