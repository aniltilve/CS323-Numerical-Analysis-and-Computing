function TestExpSin(n)

X = -5:0.001:5;

Y = exp(sin(X));
x = randsample(X,n+1);
y = exp(sin(x));
P = Pn(X,x,y);

figure;
plot(X,Y,'k-','linewidth',2);hold on; grid on;
plot(X,P,'r--','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
plot(x,y,'go','linewidth',3);
set(gca,'ylim',[min(Y)-1, max(Y)+1], 'xlim',[min(X),max(X)]);
set(gca,'xtick',min(X):1:max(X));
title(['exp(sin(x)), n=', num2str(n)])