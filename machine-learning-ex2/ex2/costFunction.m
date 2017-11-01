function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

%fprintf('length of theta is %4.2f \n',length(X));
%fprintf('length of X is %4.2f \n',length(y));

% FOR TESTING ONLY >> % fprintf('size of theta is %4.2f rows by %4.2f columns \n',size(theta,1),size(theta,2));
% FOR TESTING ONLY >> % fprintf('size of X is %4.2f rows by %4.2f columns \n',size(X,1),size(X,2));

%hypothesis = (transpose(theta))*X;

z = X*theta;
h = sigmoid(z);

onesMatrix = ones(size(y));


%---------------------ERROR FUNCTION-------------------------------

J = (1/m).*(sum(-y.*log(h)-((1-y).*log(1-h))) );

%---------------------GRADIENT-------------------------------------

% working out the partial derivatives here with respect to each x
% element...

% would like to completely vectorize this....
dgrad(1) = (1/m).*(sum((h - y)));
dgrad(2) = (1/m).*(sum((h - y).*X(:,2)));
dgrad(3) = (1/m).*(sum((h - y).*X(:,3)));

grad = dgrad';


% =============================================================

end
