function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%


%z = X*theta;

m = size(X, 1);

a1 = [ones(m, 1) X];

fprintf('pass a1 \n');

z2 = a1*Theta1';

fprintf('pass z2 \n');

a2temp = sigmoid(z2);

fprintf('pass a2temp \n');

a2 = [ones(m, 1) a2temp];

fprintf('pass a2 \n');

z3 = a2*Theta2';

fprintf('pass z3 \n');

hx = sigmoid(z3);

fprintf('size of hX is %4.2f \n', size(hx));

[yourmum,p] = max(hx, [], 2);


% =========================================================================


end
