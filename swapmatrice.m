function[Q]=swapmatrice(M,i,j)

%Entrees : M (matrice), i et j.
%Echange les lignes de M correspondants
%aux lignes i et j.
%Sortie : la matrice Q (M avec echange).

k = M(i,:);
M(i,:) = M(j,:);
M(j,:) = k;
Q = M;
end