function forest = RandomForrest(areaSize, densityVec, index) 

% forest = zeros(areaSize); 
% randDensity = 0; 
% targetDensity = densityVec(index); 
% squares = areaSize^2; 
% 
% while (randDensity < targetDensity)
%     
%     forest(randi(areaSize), randi(areaSize)) = 2; 
%     randDensity = sum(forest(:) == 2)/squares;     
%     
% end
% 
% end



forest = rand(areaSize); 
forest(forest < densityVec(index)) = 2;
forest(forest ~= 2) = 0;

end




% nrOfTrees = ceil(densityVec(index)*areaSize^2); 
% numVec = randperm(areaSize^2); 
% indices = numVec(1:nrOfTrees); 
% 
% forest = zeros(areaSize); 
% 
% for t = 1:nrOfTrees
%     
% i = floor(indices(t)/areaSize); 
% j = floor(indices(t)-areaSize*i)+1;
% i = i+1;
% 
% 
% forest(i,j) = 2;
% 
% end