function TestNCS(n)

dx = 0.001; maxX = 5; minX = -5;
X = minX:dx:maxX;
Y = 1./(1+X.^2);
t = round(length(X)/(n+1));
ind = t:t:n*t;

x = X(ind); y = Y(ind);
B = NCS(x,y);
figure;
plot(X,Y,'--','linewidth',2);hold on; grid on;
plot(x,y,'go','linewidth',3);
for i = 1:n-1
    xx = x(i):dx:x(i+1);
    b = B((i-1)*4+1:i*4);
    yy = 0;
    for j = 1:4
        yy = b(j)*xx.^(4-j)+yy;
    end
    plot(xx,yy,'r-','linewidth',2);
end

xx = min(X):dx:x(1);
A = B(1)*3*x(1)^2+B(2)*2*x(1)+B(3);
yy = A.*(xx-x(1))+y(1);
plot(xx,yy,'r-','linewidth',2);
set(gca,'fontsize',20);xlabel('x');ylabel('y');
set(gca,'xtick',min(X):1:max(X));
xx = x(end):dx:maxX;
A = B(length(B)-3)*3*x(end)^2+B(length(B)-2)*2*x(end)+B(length(B)-1);
yy = A.*(xx-x(end))+y(end);
plot(xx,yy,'r-','linewidth',2);
title(['NCS: y = 1/(1+x^2) : n = ' num2str(n)]);

