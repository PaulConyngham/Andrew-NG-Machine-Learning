function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%

%mloopCounter = 0;
%kloopCounter = 0;

errorMatrix = ones(size(X,1), 1);
errorInitializeFlag = 0;

for k = 1:K

  for m = 1:size(X,1)%length(X)
  
  
    %lets write this so that it handles all cases...
    tempError = ((sum((transpose(X(m,1:end))-transpose(centroids(k,1:end))).^2)).^(1/2)).^(2);
    
    %tempError =
    %keyboard;
    if ((tempError < errorMatrix(m,1))||( errorInitializeFlag == 0))
    
      errorMatrix(m,1) = tempError;
      idx(m,1) = k; 
           
        
    end
    
    %mloopCounter++;
  
    end

%kloopCounter++;
errorInitializeFlag = 1;

  end

%keyboard;
%poo = 1;


% =============================================================

end

