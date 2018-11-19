%forestFire 1

timeSteps = 10000;
areaSize = 128;

f = 0.05;
p = 0.01;

area = zeros(areaSize, areaSize);
mapBurn = [1 1 1; 1 0 0; 0 1 0];
colormap(mapBurn);
plot1 = imagesc('CData',area);
xlim([0 areaSize]);
ylim([0 areaSize]);


t = 0;
while(t<timeSteps)
    t = t+1;
    
    area = TreeGrowth(area, p);
    set(plot1, 'CData', area);
    drawnow
    
    area = BurnDown(area, f);
    
    if(sum(area(:) == 1) ~= 0)
        set(plot1, 'CData', area);
        drawnow
    end
    
    area(area==1) = 0;  
    
    
end