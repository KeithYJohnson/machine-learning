function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
%
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));




% Setup some useful variables
m = size(X, 1);

% You need to return the following variables correctly
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));




% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
y_matrix = eye(num_labels)(y,:);

%prepend column of ones
a1 = [ones(size(X,1),1) X];

first_layer_activation = sigmoid(a1*Theta1');
%prepend column of ones
first_layer_activation = [ones(size(first_layer_activation,1),1) first_layer_activation];

second_layer_activation = sigmoid(first_layer_activation * Theta2');

first_term = -y_matrix .* log(second_layer_activation);
second_term = (1-y_matrix) .* log(1 - second_layer_activation);
matrix_cost = (1/m) * sum(first_term - second_term);

%The first column refers to the biases and we ignore that here.
theta1_regulation_term = sum(Theta1(:,2:end) .* Theta1(:,2:end));
theta2_regulation_term = sum(Theta2(:,2:end) .* Theta2(:,2:end));
regulation_term = lambda/(2*m) * (sum(theta1_regulation_term) + sum(theta2_regulation_term));

J = sum(matrix_cost) + regulation_term;
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the
%               first time.
%
for t = 1:m
  a1 = [1; X(t,:)'];

  z2 = Theta1*a1;
  a2 = [1; sigmoid(z2)];

  z3 = Theta2 * a2;
  a3 = [sigmoid(z3)];

   %each of these terms should be a vector
   % whos dimension is equal to the number of output units
  classes = ([1:num_labels])';
  is_training_unit_vector = classes == y(t);
  delta3 = a3 - is_training_unit_vector;


  delta2 = Theta2' * delta3 .* [1; sigmoidGradient(z2)];
  delta2 = delta2(2:end);

  Theta1_grad = Theta1_grad + delta2 * a1';
  Theta2_grad = Theta2_grad + delta3 * a2';

end

%Capital D Delta updates
unreg_theta1 = (1/m) * Theta1_grad;
%regularazing
unreg_theta1(:,2:end) = unreg_theta1(:,2:end) + (lambda/m) * Theta1(:, 2:end);

unreg_theta2 =(1/m) * Theta2_grad;
%regularazing
unreg_theta2(:,2:end) = unreg_theta2(:,2:end) + (lambda/m) * Theta2(:, 2:end);

% W/0 regularization
% Theta1_gradl = (1/m) * Theta1_grad + (lambda/m) * Theta1(:, 2:end);
% Theta2_grad = (1/m) * Theta2_grad + (lambda/m) * Theta2(:, 2:end);

Theta1_grad = unreg_theta1;
Theta2_grad = unreg_theta2;





% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%



















% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
