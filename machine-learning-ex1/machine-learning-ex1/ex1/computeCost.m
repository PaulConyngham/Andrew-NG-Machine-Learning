function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

thetaTranspose = transpose(theta);
xTranspose = transpose(X);

hThetaX = thetaTranspose*xTranspose;

%fprintf('hThetaX is %4.2f \n',size(hThetaX));
%fprintf('y is %4.2f \n',size(y));

hThetaX = transpose(hThetaX);

J = (1/(2*m))*sum((hThetaX - y).^2);

%fprintf('y is %4.2f \n',J);

% =========================================================================

end
