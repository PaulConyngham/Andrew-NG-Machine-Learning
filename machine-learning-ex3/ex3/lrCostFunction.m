function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));
dgrad = zeros(size(theta)); 

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there're many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%

z = X*theta;

hx = sigmoid(z);


%fprintf('size of theta is %4.2f \n', size(theta));


% old slightly wrong error function
%J = (1/m).*(sum(-y.*log(h)-((1-y).*log(1-h))) ) + (lambda/(2*m))*sum(theta(2:end,1).^2);


%these guys were the wrong size: -y' * log(hx)
J = (sum(-y' * log(hx) - (1 - y')*log(1 - hx)) / m) + lambda * sum(theta(2:end).^2) / (2*m);

%we do not regularize theta(0)... hence this term [0; ones(length(theta)-1, 1)] creating a vector with the first element set to zero and the rest ones 
% hence preserving their data
% the term (hx-y)' * X/m comes from the worksheet simplification of the regularized gradient equation 

grad =((hx - y)' * X / m)' + lambda .* theta .* [0; ones(length(theta)-1, 1)] ./ m ;


%fprintf('calculated the gradient \n');

%could substitute end for :size(X)) in above statment



% =============================================================

grad = grad(:);

end
