% Args:
%   data         Rows correspond to observations
%   lambda       A scalar. It controls the probability of assign a data
%                point to a new cluster
%   maxIter      The number of iterations.
% Returns:
%   mu           The means of each cluster
%   assignments  A vector. Shows which cluster to be assigned for each data 
%                point
%   loss_vec     The sum of the distances of each data point to its nearest
%                cluster
%   num_clusters The number of clusters in each iteration
function [mu, assignments, loss_vec, num_clusters] = DP_means(data, lambda, maxIter)
mu = mean(data);
loss_vec = zeros(1, maxIter);
num_clusters = zeros(1, maxIter);

for iter = 1:maxIter
    % compute the distance between every data point and center
    distances = pdist2(mu, data);
    [min_values, assignments] = min(distances, [], 1);
    loss_vec(iter) = sum(min_values);
    
    % reassign new clusters
    idx = find(min_values >= lambda);
    if ~isempty(idx)
        assignments(idx) = size(mu, 1) + 1;
    end
    B = accumarray(assignments', 1:length(assignments), [], @(x){x});
    B(cellfun(@isempty, B)) = []; % delete empty clusters
    num_clusters(iter) = length(B);
    
    % update centers
    mu = zeros(length(B), size(data, 2));
    for i = 1:size(mu, 1)
        mu(i,:) = mean(data(B{i}, :), 1);
    end
end




