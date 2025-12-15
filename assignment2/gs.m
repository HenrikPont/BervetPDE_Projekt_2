function x = gs(A,b,x0,tol,maxit)

L = tril(A, -1);
U = triu(A, 1);
D = diag(diag(A));

for k = 1:maxit
    x1 = (L+D) \ (b - U * x0);
    if norm(A*x1 - b, 2)/norm(b, 2) < tol
        break;
    end
    x0 = x1; 
end

if norm(A*x1 - b, 2)/norm(b, 2) > tol
    warning('Maximum iterations reached without convergence.');
end

x = x1;
end