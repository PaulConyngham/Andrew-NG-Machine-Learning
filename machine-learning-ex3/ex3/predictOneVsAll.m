function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1). 
%  p = PREDICTONEVSALL(all_theta, X) will return a vector of predictions
%  for each example in the matrix X. Note that X contains the examples in
%  rows. all_theta is a matrix where the i-th row is a trained logistic
%  regression theta vector for the i-th class. You should set p to a vector
%  of values from 1..K (e.g., p = [1; 3; 1; 2] predicts classes 1, 3, 1, 2
%  for 4 examples) 

m = size(X, 1);
num_labels = size(all_theta, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned logistic regression parameters (one-vs-all).
%               You should set p to a vector of predictions (from 1 to
%               num_labels).
%
% Hint: This code can be done all vectorized using the max function.
%       In particular, the max function can also return the index of the 
%       max element, for more information see 'help max'. If your examples 
%       are in rows, then, you can use max(A, [], 2) to obtain the max 
%       for each row.
%       

fprintf('size of X is %4.2f \n', size(X));
fprintf('size of X is %4.2f \n', size((all_theta')));

 %hx = zeros(size(X,1),size(1,all_theta'));

 hx = sigmoid(X*(all_theta'));
 
 fprintf('size of hx is %4.2f \n', size(hx));
 
 %hxtemp = hx';
 %[yourmum,p] = max(hxtemp);
 [yourmum,p] = max(hx, [], 2);
 
 %fprintf('size of p is %4.2f \n', size(p));
 
 %p = tempP;
 
 
 %hxdigit = hx';
 %ptemp = max(hxdigit);
 
 %fprintf('size of ptemp is %4.2f \n', size(ptemp));
 
 % = ptemp;

 % just return the index.. (the index = the prediction of the number)
 % except for 10 , where 10 represents 0.
 %for k= 1:num_labels
  
 %tempP = max(hx, [], 2);
 
%end   

%fprintf('size of p is %4.2f \n', size(p));
%fprintf(' p is %4.2f \n', size(p));
% =========================================================================


end
