function area = BurnDown(area, f)

if (rand<f)
    
    burningTrees = [randi(size(area,1)), randi(size(area,2))];
    
    while(numel(burningTrees)>0)
        
        tempburningTrees = [];
        
        for i = 1:size(burningTrees,1)
            if(area(burningTrees(i,1),burningTrees(i,2)) == 1)
                tree = burningTrees(i,:);
                area(tree(1), tree(2)) = 2;
                
                try
                    if(area(tree(1,1)+1, tree(1,2)) == 1)
                        tempburningTrees = [tempburningTrees; [tree(1,1)+1, tree(1,2)]];
                    end
                catch
                end
                
                try
                    if(area(tree(1,1), tree(1,2)+1) == 1)
                        tempburningTrees = [tempburningTrees; [tree(1,1), tree(1,2)+1]];
                    end
                catch
                end
                
                try
                    if(area(tree(1,1)-1, tree(1,2)) == 1)
                        tempburningTrees = [tempburningTrees; [tree(1,1)-1, tree(1,2)]];
                    end
                catch
                end
                
                try
                    if(area(tree(1,1), tree(1,2)-1) == 1)
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
