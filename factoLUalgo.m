clear all; clc; close all;

%% Dimension

fin = 400;

%% Factorisation LU classique vs GEPP Toeplitz complexe

for z=(1:fin),
    
    [M,G,B] = randtoeplitzimaginaire(z);
    
    tic
    
    [L,U] = factorisationLU(M);

    time1(z) = toc
    
    [M,G,B] = randtoeplitzimaginaire(z);
    
    tic
    
    [C,newG,newB,s,t]=TtoC(M,G,B);
    [P,L,U] = geppCl(C,newG,newB,s,t);
    
    time2(z) = toc

end

%% Factorisation LU rapide Toeplitz complexe

for z=(1:fin),
    
    [M,G,B] = randtoeplitzimaginaire(z);
    
    [Ga,Ba] = generatorTtoC(M);
    [Gb,Bb] = generatorTpHtoC(M);
    
    tic
    
    [C,newG,newB,s,t]=TtoC(M,Ga,Ba);
    [P,L,U] = geppCl(C,newG,newB,s,t);
    
    time2(z) = toc
        
    tic
    
    [C,newG,newB,s,t]=TpHtoC(M,Gb,Bb);
    [P,L,U] = geppCl(C,newG,newB,s,t);
    
    time3(z) = toc
    
end

%% Factorisation LU classique Toeplitz reelle

for z=(1:fin),
    
    [M,G,B] = randtoeplitzreel(z);
    
    tic
    
    [L,U] = factorisationLU(M);

    time4(z) = toc
    
    tic
    
    [C,newG,newB,s,t]=TtoC(M,G,B);
    [P,L,U] = geppCl(C,newG,newB,s,t);
    
    time5(z) = toc

end

%% Factorisation LU rapide Toeplitz reel

for z=(1:fin),
    
    M = randtoeplitzreel(z);
    
    [Ga,Ba] = generatorTtoC(M);
    [Gb,Bb] = generatorTpHtoC(M);
    
    tic
    
    [C,newG,newB,s,t]=TtoC(M,Ga,Ba);
    [P,L,U] = geppCl(C,newG,newB,s,t);
    
    time5(z) = toc
        
    tic
    
    [C,newG,newB,s,t]=TpHtoC(M,Gb,Bb);
    [P,L,U] = geppCl(C,newG,newB,s,t);
    
    time6(z) = toc
    
end

%% Axe des abscisse

x = 1:fin;

%plot(x,time1,x,time2); %complexe classique vs rapide TtoC
%plot(x,time2,x,time3) %complexe rapide TtoC vs TpHtoC
%plot(x,time4,x,time5) %reel classique vs rapide TtoC
%plot(x,time5,x,time6) %reel rapide TtoC vs TpHtoC
xlabel('dimensions matrice');
ylabel('temps en secondes');