function[L,U]=factorisationLU(A)

%Entree : la matrice M.
%factorisation LU dite classique de la matrice M.
%Sorties : les matrices L et U et P.

n = length(A);

U = zeros(n,n); L = zeros(n,n);

U(1,1) = A(1,1);

for j=2:n,
    U(1,j) = A(1,j);
    L(j,1) = (A(j,1)/A(1,1));
end

for i=2:(n-1),
    S1 = 0;
    for k=1:(i-1),
        S1 = S1 + L(i,k)*U(k,i);
    end
    U(i,i) = A(i,i) - S1;
    for j=(i+1):n,
        S2 = 0;
        for k=1:(i-1),
            S2 = S2 + L(i,k)*U(k,j);
        end
        U(i,j) = A(i,j) - S2;
        S3 = 0;
        for k=1:(i-1),
            S3 = S3 + L(j,k)*U(k,i);
        end
        L(j,i) = ((1/(U(i,i))*(A(j,i)-S3)));
    end
end

S4 = 0;
for k=1:(n-1),
    S4 = S4 + L(n,k)*U(k,n);
end

U(n,n) = A(n,n) - S4;

L = eye(n)+L;

end