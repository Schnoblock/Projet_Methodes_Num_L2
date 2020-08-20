function[C,newG,newB,s,t]=TtoC(T,G,B)

%Entrees : Matrices T (Toeplitz-like), G et B.
%...
%Sortie : Matrice C (Chauchy-like).

n = length(T);
F = dftmtx(n);

v1 = zeros(1,n); v2 = v1; v0 = v1;
for j=1:n,
    v0(j) = exp(((j-1)*pi*1i)/n);
    v1(j) = exp((2*pi*1i*(j-1))/n);
    v2(j) = exp(((2j-1)*pi*1i)/n);
end
D0 = diagonale(v0);
s = v1;
t = v2;

Bx = conj(B)';
Fx = conj(F)';

newG = F*G;
newBx = F*D0*Bx;
C = F*T*D0^(-1)*Fx;

newB = conj(newBx)';

end