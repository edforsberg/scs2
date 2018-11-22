function forest = BurnDown(forest, f)

if (rand<f)
    
    burningTrees = [randi(size(forest,1)), randi(size(forest,2))];
    
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
end
end
