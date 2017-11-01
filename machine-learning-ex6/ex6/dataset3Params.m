function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

bestC = 1;
bestsigma = 0.3;
bestCurrentError = 1.0;

testset = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
predictions = zeros(64,1);

%sum(theta(2:end).^2) / (2*m);

for i = 1:length(testset)

C = testset(i,1);

            for j = 1:length(testset)
            
              sigma = testset(j,1);
              
              %x1 = [1 2 1]; 
              
              %X1 = transpose(Xval(1:end,1));
              %X2 = transpose(Xval(1:end,2));
              
              %why does this work? Why are we using the training data for a different problem?
              %x1 = [1 2 1]; x2 = [0 4 -1]; 
              
              %tempsim = gaussianKernel(transpose(Xval(1:end,1)), transpose(Xval(1:end,2)), sigma);
              %tempsim = gaussianKernel(X1, X2, sigma);
              
              %what does @(x1, x2) mean?
              tempModel = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
              
              poo = 1;
              %make a prediction of the i th C and j th sigma...store it
              tempprediction = svmPredict(tempModel, Xval);
              %predictions((j+((i-1)*8),1) =  svmPredict(tempModel, Xval);
              
              %evaluate the error
              error = mean(double(tempprediction ~= yval));
              
              if (error < bestCurrentError)
              
               bestCurrentError = error;
               bestC = C;
               bestsigma = sigma; 
              
              endif
              
            
            endfor

endfor


C = bestC;
sigma = bestsigma;

%function pred = svmPredict(model, X)

%function pred = svmPredict(model, X)
%function pred = svmPredict(model, X)
%sim = gaussianKernel(x1, x2, sigma)
%function [model] = svmTrain(X, Y, C, kernelFunction, tol, max_passes)
%ones(length(theta)-1, 1)

% =========================================================================

end
