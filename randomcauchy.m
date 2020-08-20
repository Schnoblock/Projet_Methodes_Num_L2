function[C,H,P,f,r]=randomcauchy(n,a)

H = randomatrix(n,a,100);
P = randomatrix(a,n,100);
f = randomatrix(n,1,100);
r = randomatrix(n,1,10);

C = Cauchygen(H,P,f,r);

end
