function[P]=Permut(i,j,n)

%Entrees : i et j, lignes a permuter. n, taille de la matrice.
%Donne la matrice Pij de Knxn, permettant de permuter les lignes i et j
%d'une matrice A de Knxn par P*A.
%Sortie : matrice P de permutation.

P = identite(n);
P(i,i) = 0;
P(j,j) = 0;
P(i,j) = 1;
P(j,i) = 1;

end