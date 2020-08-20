function[l]=maxcolmatrice(M,c)

%Entrees : Matrice M, nombre c.
%Retourne la ligne l du maximum de la
%colone c dans la matrice M.

colone = abs(M(:,c));

l=1;

for k=1:(length(colone)-1),
    if colone(k) < colone(k+1)
        l = l+1;
    end
end

end
