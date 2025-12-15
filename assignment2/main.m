%% Test gauss seidel

A = [4, 1, 0, 0; 1, 4, 1, 0; 0, 1, 4, 1; 0, 0, 1, 4];
b = [1; 1; 1; 1];
x = A \ b;
gs(A, b, zeros(size(b)), 1e-6, 100);

%Works!

%% Test on big system
[A, b] = get_system(50);

tic;
A \ b;
t = toc;
fprintf('Time taken for A\\b: %.6f seconds\n', t);

tic;
pcg(A, b, 1e-6, 1000);
t = toc;
fprintf('Time taken for pcg: %.6f seconds\n', t);

tic;
R = chol(A, 'lower');
y = R \ b; % Solve R*y = b
x = R' \ y; % Solve R'*x = y
t = toc;
fprintf('Time taken for Cholesky: %.6f seconds\n', t);

tic;
y = R \ b; % Solve R*y = b
x = R' \ y; % Solve R'*x = y
t = toc;
fprintf('Time taken for precomputed Cholesky: %.6f seconds\n', t);

tic;
gs(A, b, zeros(size(b)), 1e-6, 100000);
t = toc;
fprintf('Time taken for Gauss Seidel: %.6f seconds\n', t);