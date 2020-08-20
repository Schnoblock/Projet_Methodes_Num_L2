function[T,G,B] = randtoeplitzcomplexe(n)

%Entree : taille n de la matrice.
%Grace a la methode de decomposition par valeur singuliere,
%generation d'une matrice toeplitz-like ainsi que calcul de
%son generateur.
%Sortie : les matrices T, G et B.

a = zeros(1,n);
b = zeros(1,n);

for i=1:n,
    a(i) = floor(-10+20.*rand)+1i*floor(-10+20.*rand);
    b(i) = floor(-10+20.*rand)+1i*floor(-10+20.*rand);
end

T = toeplitz(a,b);

[G,B] = generator(T);

end