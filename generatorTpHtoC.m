function[G,B]=generatorTpHtoC(T)

%Entree : la matrice T (de toeplitz).
%Calcul le generateur (G,B) du deplacement de la matrice grace
%a la decomposition par valeur singuliere.
%Sortie : les matrices G et B.


n = length(T);

F = Ygenerator(n,0,0); A = Ygenerator(n,1,1);
deplacement = F*T-T*A;
[U,S,V] = svd(deplacement);
r       = rank(deplacement);
UU = U(:,1:r);
VV = V(:,1:r);
SS = S(1:r,1:r);
G = UU;
B = SS*VV';

end