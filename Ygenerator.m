function[Y]=Ygenerator(n,g,d)

Y = Zgenerator(n,0)+Zgenerator(n,0)';

Y(1,1) = g;
Y(n,n) = d;

end