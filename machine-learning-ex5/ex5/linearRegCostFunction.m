function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


%thetaTranspose = transpose(theta);
%xTranspose = transpose(X);

%hThetaX = thetaTranspose*xTranspose;



%fprintf('hThetaX is %4.2f \n',size(hThetaX));
%fprintf('y is %4.2f \n',size(y));

%hThetaX = transpose(hThetaX);

%thetatemp = theta(2:end).^2;

hx = X*theta;

J = (1/(2*m))*sum((hx - y).^2) + (lambda / (2*m) )*sum(theta(2:end).^2);

%we do not regularize theta(0)... hence this term [0; ones(length(theta)-1, 1)] creating a vector with the first element set to zero and the rest ones 
% hence preserving their data
% the term (hx-y)' * X/m comes from the worksheet simplification of the regularized gradient equation 

grad =((hx - y)' * X / m)' + lambda .* theta .* [0; ones(length(theta)-1, 1)] ./ m ;


% =========================================================================

grad = grad(:);

end
