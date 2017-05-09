clear
clc

data = data_generate();
[mu, assignments, loss_vec, num_clusters] = DP_means(data, 7, 20);

figure(1)
scatter(data(:,1), data(:,2))
title('The generated data set')

figure(2)
plot(loss_vec)
title('Loss in each iteration')

figure(3)
plot(num_clusters)
title('Number of clusters in each iteration')

tabulate(assignments)

c = unique(assignments);
figure(4)
hold on 
for i = 1:length(c)
    scatter(data(assignments == i, 1), data(assignments == i, 2))
end
title('The clustering result')