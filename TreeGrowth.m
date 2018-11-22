function forest = TreeGrowth(forest, p)

for i = 1:size(forest,1)
    for j = 1:size(forest,2)
        
        if (rand<p)
            forest(i,j) = 2;
        end
    end
end