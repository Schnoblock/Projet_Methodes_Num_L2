function[P,L,U]=geppCl(C,G,B,s,t)

%Entrees : Matrices C, H et P. vecteurs f et r.
%Factorisation de C sous la forme C=p*L*U.
%C etant solution de l'equation Df*C-C*Dr=H*P (ou Df et Dr
%sont les matrices diagonales des vecteurs f et r).
%Sorties : p, L et U.

n = length(C);
L = zeros(n,n);
U = zeros(n,n);
P = identite(n);

for k=1:n,
    for j=k:n,
        L(j,k) = (G(j,:)*B(:,k)/(s(j)-t(k)));
    end
    q = maxcolmatrice(L,k);
    U(k,k) = L(q,k);
    s = swapvect(s,k,q);
    G = swapmatrice(G,k,q);
    L = swapmatrice(L,k,q);
    P = swapmatrice(P,k,q);
    for j=(k+1):n,
        U(k,j) = (G(k,:)*B(:,j)/(s(k)-t(j)));
    end
    L(k,k)=1;
    for j=(k+1):n,
        L(j,k) = (L(j,k)/U(k,k));
        B(:,j) = (B(:,j)-(B(:,k)*(U(k,j)/U(k,k))));
        G(j,:) = (G(j,:)-(G(k,:)*L(j,k)));
    end
end

end