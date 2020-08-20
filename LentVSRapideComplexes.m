clear all; clc; close all;

%% Dimension et initialsation

fin = 50;
nombre = 100;

time1 = zeros(fin,nombre);
time2 = time1;

%% Factorisation LU classique vs GEPP Toeplitz complexe
for k = (1:nombre),
    for z = (1:fin),

        [M,G,B] = randtoeplitzimaginaire(z);

        tic

        [L,U] = factorisationLU(M);

        time1(z,k) = toc;

        [M,G,B] = randtoeplitzimaginaire(z);

        tic

        [C,newG,newB,s,t]=TtoC(M,G,B);
        [P,L,U] = geppCl(C,newG,newB,s,t);

        time2(z,k) = toc;

    end
end

time12 = zeros(1,fin);
time22 = time12;

for k = (1:fin),
    time12(k) = Moyenne(time1(k,:));
    time22(k) = Moyenne(time2(k,:));
end

x = 1:fin;

plot(x,time12,x,time22);
xlabel('dimensions matrice');
ylabel('temps en secondes');
legend('Classique','Rapide');