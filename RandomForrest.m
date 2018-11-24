function forest = RandomForrest(areaSize, densityVec, index) 

forest = rand(areaSize); 
forest(forest < densityVec(index)) = 2;
forest(forest ~= 2) = 0;

end


