function[x]=Axbsolver(A,b)

%Entree : la matrice A (ici de toeplitz) et le vecteur b.
%Calcul du vecteur inconnu x, solution de l'equation Ax=b.
%Sorties : le vecteur x.

[G,B]=generator(A);
[Cauchy,newG,newB,s,t]=TpHtoC(A,G,B);
[P,L,U] = geppCl(Cauchy,newG,newB,s,t);

n = length(A);

y = zeros(n,1);

y(1)=b(1)/L(1,1);

for i=2:n,
    S1 = 0;
    for j=1:(i-1),
        S1 = S1 + L(i,j)*y(j)/L(i,i);
    end
    y(i) = b(i) - S1;
end

x(1) = y(1)/U(1,1);

for i=2:n;
    S2 = 0;
    for j=1:(i-1),
        S2 = S2 + U(i,j)*x(j)/U(i,i);
    end
      x(i) = y(i) - S2;
end

end