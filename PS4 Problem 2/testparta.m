clear all

Vmax12=5;
Vmax34=1;
Ks=5;
Ki=1;
Stot=100;
I1=0;
I2=0;
syms a b c
eqn1= Vmax12*a/((1+I1/Ki)*(Ks+a))==Vmax34*b/(Ks+b);
eqn2=Vmax12*a/((1+I2/Ki)*(Ks+a))==Vmax34*c/(Ks+c);
eqn3= a==Stot-b-c;
[sola, solb, solc] = vpasolve([eqn1,eqn2, eqn3],[a,b,c],[0 Stot;0 Stot;0 Stot])