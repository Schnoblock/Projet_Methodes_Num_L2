function[Cauchy,newG,newB,s,t]=TpHtoC(T,G,B)

n = length(T);

S = zeros(n,n);
C = zeros(n,n);

q = ones(1,n);
q(1) = 1/(sqrt(2));

for k=1:n,
    for j=1:n,
        S(k,j)=(sqrt(2/n)*q(j)*cos((2*k-1)*(j-1)*pi/(2*n)));
        C(k,j)=(sqrt(2/(n+1))*sin(k*j*pi/(n+1)));
    end
end

s = zeros(1,n);
t = zeros(1,n);

for i=1:n,
    s(i) = 2*cos((i-1)*pi/n);
    t(i) = 2*cos(i*pi/(n+1));
end

Cauchy = S*T*C;
newG = S*G;
newBt = C'*B';
newB = newBt';

end