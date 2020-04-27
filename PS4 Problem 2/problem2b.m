clear;
n=16;
iBoundL=0.01;
iBoundH=100;
%parameter definitions
I2=[0.01 0.02 0.05 0.1 0.2 0.5 1 2 5 10 20 50 100 200 500 1000];
I1=I2;
Vmax12=5;
Vmax34=1;
Ks=5;
Ki=1;
Stot=100;

A=zeros(n,n);
B=zeros(n,n);
C=zeros(n,n);

for i2=1:n
    for i1=1:n
        syms a b c
        eqn1= Vmax12*a/((1+(I1(i1))/Ki)*(Ks+a))==Vmax34*b/(Ks+b);
        eqn2=Vmax12*a/((1+(I2(i2))/Ki)*(Ks+a))==Vmax34*c/(Ks+c);
        eqn3= a==Stot-b-c;
        [sola, solb, solc] = vpasolve([eqn1,eqn2, eqn3],[a,b,c],[0 Stot;0 Stot;0 Stot]);
        A(i2,i1)=double(sola);
        B(i2,i1)=double(solb);
        C(i2,i1)=double(solc);
    end
end 

contourf(I1,I2,A)
set(gca,'YScale','log')
set(gca,'XScale','log')
title('[A] vs. [I2] and [I1]')
xlabel('[I1]') 
ylabel('[I2]')