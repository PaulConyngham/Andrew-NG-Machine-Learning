function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

%fprintf('length of x is %4.2f \n',length(X));
%fprintf('length of y is %4.2f \n',length(y));


%updating simultaneoulsy because in the first line (detheta(1)) 
% if for example, we had the following equation doing the work:

% (1):  theta(1) = theta(1) - (alpha/m).*(sum(X*theta - y));
% then
% (2):  theta(2) = theta(2) - (alpha/m).*(sum((X*theta - y).*X(:,2)));

% in the first case (1), theta parameter 1 is updated. If we continue to
% use it to update the second case (2), then theta paramter one will be
% used here again (in caps) 
% theta(2) = theta(2) - (alpha/m).*(sum((X*THETA - y).*X(:,2)));
%
% this is incorrect as it needs to be updated simulataneously
%
% therefore we update theta1 & theta2 seperately,
% storing both results into temporary variables and then finally
% updating the MATRIX theta SIMULTANEOUSLY at the end

% correct code below:
dtheta(1) = theta(1) - (alpha/m).*(sum(X*theta - y));
dtheta(2) = theta(2) - (alpha/m).*(sum((X*theta - y).*X(:,2)));

theta = dtheta';

currentJ = computeCost(X, y, theta); 
%plot(X(:,2), X*theta, '-');

fprintf('current cost is %4.2f \n',currentJ);

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
