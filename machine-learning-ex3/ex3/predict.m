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

% Append column of ones.
% X(:,401) = ones(5000,1)

# Prepend column of ones.
num_rows = size(X,1);
num_columns = size(X,2);
X(:,2:num_columns + 1) = X;
X(:,1) = ones(num_rows,1);

first_layer_activation = sigmoid(X * Theta1');

first_layer_activation_num_columns = size(first_layer_activation,2);
first_layer_activation(:,2:first_layer_activation_num_columns+1) = first_layer_activation;
first_layer_activation(:,1) = ones(num_rows,1);

second_layer_activation = sigmoid(first_layer_activation * Theta2');
[highest_value, highest_values_index] = max(second_layer_activation,[],2);
p = highest_values_index;







% =========================================================================


end
