function[e] = Errorfunc(A,B)

E = A-B;

[n,p] = size(A);

S = 0;

for i = 1:n,
    for j = 1:p,
        S = S + abs(E(i,j)/B(i,j));
    end
end

e = 100*S/(n*p);

end