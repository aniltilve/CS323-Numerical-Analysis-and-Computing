function TestPn(n)

X = -5:0.001:5;
A = (2*rand(1,n+1)-1).*[1:n+1];

Y = polyval(A,X);
x = randsample(X, n+1);
y = polyval(A,x);

P = Pn(X,x,y);
figure;
plot(X,Y,'k-','linewidth',2);hold on; grid on;
plot(X,P,'r--','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
plot(x,y,'go','linewidth',3);
set(gca,'xtick',min(X):max(X));
title(['polynomial, n=', num2str(n)])

