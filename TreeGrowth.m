function area = TreeGrowth(area, p)

for i = 1:size(area,1)
    for j = 1:size(area,2)
        
        if (rand<p)
            area(i,j) = 1;
        end
    end
end