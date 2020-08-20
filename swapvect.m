function[q]=swapvect(v,i,j)

%Entrees : v (matrice), i et j.
%Echange les emplacements du vecteur v
%correspondants aux emplacements i et j.
%Sortie : le vecteur q, vecteur v avec l'echange.

k=v(i);
v(i)=v(j);
v(j)=k;
q=v;
end