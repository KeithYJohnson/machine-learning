function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);


% θj := θj − α (hθ(x(i)) − y(i))x(i)

for iter = 1:num_iters


    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta.
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    feature_activation = X * theta;
    diff_matrix = feature_activation - y;
    delta = (alpha * (1/m)) * diff_matrix' * X
    theta = theta - delta'
    % ============================================================

    % Save the cost J in every iteration
    cost = computeCost(X, y, theta);
    disp('cost')
    disp(cost)
    J_history(iter) = computeCost(X, y, theta);

end

end
