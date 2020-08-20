function[M] = Moyenne(v)

n = length(v);

S = 0;
for k = (1:n),
    S = S + v(k);
end

M = S/n;

end