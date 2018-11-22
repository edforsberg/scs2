function burntTrees = StartFire(areaSize, forest)

[i,j] = find(forest == 2); 
index = randi(size(i,1)); 

burningTrees = [i(index),j(index)];
    
    while(numel(burningTrees)>0)
        
        tempburningTrees = [];
        
        for i = 1:size(burningTrees,1)
            if(forest(burningTrees(i,1),burningTrees(i,2)) == 2)
                tree = burningTrees(i,:);
                forest(tree(1), tree(2)) = 1;
                
                try
                    if(forest(tree(1,1)+1, tree(1,2)) == 2)
                        tempburningTrees = [tempburningTrees; [tree(1,1)+1, tree(1,2)]];
                    end
                catch
                end
                
                try
                    if(forest(tree(1,1), tree(1,2)+1) == 2)
                        tempburningTrees = [tempburningTrees; [tree(1,1), tree(1,2)+1]];
                    end
                catch
                end
                
                try
                    if(forest(tree(1,1)-1, tree(1,2)) == 2)
                        tempburningTrees = [tempburningTrees; [tree(1,1)-1, tree(1,2)]];
                    end
                catch
                end
                
                try
                    if(forest(tree(1,1), tree(1,2)-1) == 2)
                        tempburningTrees = [tempburningTrees; [tree(1,1), tree(1,2)-1]];
                    end
                catch
                end
                
            end
        end
        burningTrees = tempburningTrees;
    end
    burntTrees = sum(forest(:) == 1); 
end
