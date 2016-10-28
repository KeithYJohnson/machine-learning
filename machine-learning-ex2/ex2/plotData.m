function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


pos = find(y == 1);
neg = find(y == 0);

% Plot Examples% Marker types here% https://www.mathworks.com/help/matlab/ref/linespec.html#bs3b5y3-1plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 3, ...     'MarkerSize', 7);% Colors can be found on this page% https://www.mathworks.com/help/matlab/ref/plot.htmlplot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'm', ...     'MarkerSize', 7);





% =========================================================================



hold off;

end
