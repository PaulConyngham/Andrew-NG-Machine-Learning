function [X_poly] = polyFeatures(X, p)
%POLYFEATURES Maps X (1D vector) into the p-th power
%   [X_poly] = POLYFEATURES(X, p) takes a data matrix X (size m x 1) and
%   maps each example into its polynomial features where
%   X_poly(i, :) = [X(i) X(i).^2 X(i).^3 ...  X(i).^p];
%


% You need to return the following variables correctly.
X_poly = zeros(numel(X), p);

% ====================== YOUR CODE HERE ======================
% Instructions: Given a vector X, return a matrix X_poly where the p-th 
%               column of X contains the values of X to the p-th power.
%
% 




for i = 1:p

Xtemp = X;

X_poly(:,i) = Xtemp.^i;


end

% =========================================================================

end

%OK abandoning my fancy vectorization of it all for another time...


%fprintf('size of theta is %4.2f \n', size(theta));

%fprintf('pass\n');
%fprintf('size of X is %4.2f \n', size(X));

%X_poly_temp = transpose(X(1:end,1));
%X_poly_temp_transpose = transpose(X_poly_temp);

 % for k = 1:i
    
   % X_poly(:,i) = X_poly_temp*X_poly(:,i);

 % end


%fprintf('end\n');