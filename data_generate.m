function data = data_generate()
X1 = randn(100, 2);
X1(:,2) = X1(:,2) - 4;
X1(:,1) = X1(:,1) + 4;
X2 = randn(100, 2) + 4;
X3 = randn(100, 2) - 4;
data = [X1; X2; X3];
idx = randperm(300);
data = data(idx, :);


