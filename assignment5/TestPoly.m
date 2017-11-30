function TestPoly(n)

X = -1:0.001:1;
Y = f(X);

c = 1;
x = zeros(1,n+1);
for i = 1:n+1
    x(i) = cos((c * pi)/(2 * (n+1)));
    c = c+2;
end
y = f(x);

C = Pn(X,x,y);
L = LegPolyApprox(X,n);

figure;
plot(X,Y,'r--','linewidth',2);hold on; grid on;
plot(X,C,'k-','linewidth',2);
plot(X,L,'b-','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
title(['f(x) = exp(sin(5x)), n=', num2str(n)])
legend('f(x)', 'c(x)', 'p(x)');

err = [max(abs(f(X)-C)) max(abs(f(X)-L)) sqrt(mean((f(X)-C).^2)) sqrt(mean((f(X)-L).^2))];

figure;
plot(X,abs(f(X)-C),'k-','linewidth',2);hold on; grid on;
plot(X,abs(f(X)-L),'b-','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('Abs error');
title(['f(x) = exp(sin(5x)), n=', num2str(n)])
legend('|f(x)-c(x)|', '|f(x)-p(x)|');