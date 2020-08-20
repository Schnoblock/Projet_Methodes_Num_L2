clear all; clc; close all;

%% Dimension et initialsation

fin = 130;
nombre = 30;

time1 = zeros(fin,nombre);
time2 = time1;

%% Factorisation LU rapide Toeplitz Complexe
for k = (1:nombre),
    for z=(1:fin),

        M = randtoeplitzimaginaire(z);

        [Ga,Ba] = generatorTtoC(M);
        [Gb,Bb] = generatorTpHtoC(M);

        tic

        [C,newG,newB,s,t]=TtoC(M,Ga,Ba);
        [P,L,U] = geppCl(C,newG,newB,s,t);

        time1(z,k) = toc;

        tic

        [C,newG,newB,s,t]=TpHtoC(M,Gb,Bb);
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
legend('Toeplitz','Toeplitz-plus-Hankel');