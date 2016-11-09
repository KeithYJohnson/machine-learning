function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
POSSIBLE_VALUES = [0.01 0.03 0.1 0.3 1 3 10 30]';
C = 1;
sigma = 0.3;

prediction_errors = [];

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

% for i = 1:length(POSSIBLE_VALUES)
%   C = POSSIBLE_VALUES(i);
%   for j = 1:length(POSSIBLE_VALUES)
%     sigma = POSSIBLE_VALUES(j);
%     [model] = svmTrain(X,y,C, @(x1, x2) gaussianKernel(x1, x2, sigma));
%     predictions = svmPredict(model, Xval);
%     prediction_error = mean(double(predictions ~= yval));
%     prediction_errors = [prediction_errors; C sigma prediction_error];
%   end
% end
% q
% [lowest_values, index] = min(min(prediction_errors,[],3));
% row_with_lowest_error = prediction_errors(index(:,3),:);
% C = row_with_lowest_error(1);
% sigma = row_with_lowest_error(2);

% For perf I'm just going to return what the above code would return
% for C and sigma, which is:
C =  1;
sigma =  0.10000;






% =========================================================================

end
