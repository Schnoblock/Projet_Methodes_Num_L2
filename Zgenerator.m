function[Z]=Zgenerator(n,a)

Z = zeros(n,n);

for i=2:n,
    Z(i,i-1)=1;
end

Z(1,n)=a;

end
