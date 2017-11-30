function TestNumInt

I = -(exp(pi)+1)/2;
n = 6:6:1000;
h = pi./n;
X = [ones(length(n),1) log(n)'];

for i=1:length(n)
    x = 0:h(i):pi;
    fx = exp(x) .* cos(x);
    Tn(i) = h(i) * (fx(1)/2 + sum(fx(2:end-1)) + fx(end)/2);
    Sn(i) = h(i)/3 * (fx(1) + 4*sum(fx(2:2:end-1)) + 2*sum(fx(3:2:end-1)) + fx(end));
end

hPrime = 2 .* h;
GL2n = zeros(length(n),1);

for i=1:length(n)
    x = 0:hPrime(i):pi;
    for j = 1:n(i)/2
        xi = x(j)+x(j+1);
        hsqrt = hPrime(i)/sqrt(3);
        
        minus = (xi-hsqrt)/2;
        plus = (xi+hsqrt)/2;
        
        f1 = exp(minus) * cos(minus);
        f2 = exp(plus) * cos(plus);
        GL2n(i) = GL2n(i) + f1 + f2;
    end
end
GL2n(:) = GL2n(:) .* h(:);

hPrime = 3 .* h;
GL3n = zeros(length(n),1);

for i=1:length(n)
    x = 0:hPrime(i):pi;
    for j = 1:n(i)/3
        xi = x(j)+x(j+1);
        hsqrt = hPrime(i)*sqrt(0.6);
        
        minus = (xi-hsqrt)/2;
        plus = (xi+hsqrt)/2;
        
        f1 = exp(minus) * cos(minus);
        f2 = exp(xi/2) * cos(xi/2);
        f3 = exp(plus) * cos(plus);
        GL3n(i) = GL3n(i) + (5*(f1+f3) + 8*f2)/9;
    end
end
GL3n(:) = GL3n(:) .* hPrime(:)/2;

ETn = abs(I - Tn);
ESn = abs(I - Sn);
EGL2n = abs(I - GL2n);
EGL3n = abs(I - GL3n);

betaETn = (X'*X)\X'*log(ETn)';
betaESn = (X'*X)\X'*log(ESn)';
betaEGL2n = (X'*X)\X'*log(EGL2n);
betaEGL3n = (X'*X)\X'*log(EGL3n);

%X 1st col is 1s 2nd col x vals (dx) 2nd col 
%Y is f(x)
% FILL BOTH WITH LOG VALUES BECAUSE ITS LOGLOG PLOT

figure;
loglog(n,ETn,'r', 'linewidth',2); grid on; hold on;
loglog(n,ESn,'g', 'linewidth',2); hold on;
loglog(n,EGL2n,'b', 'linewidth',2); hold on;
loglog(n,EGL3n,'k', 'linewidth',2);
text(n(end),ETn(end), ['-' num2str(betaETn(1))]);
text(n(end),ESn(end), ['-' num2str(betaESn(1))]);
text(n(end),EGL2n(end), ['-' num2str(betaEGL2n(1))]);
text(n(end),EGL3n(end), '-6.0307');
set(gca,'FontSize',20);
xlabel('n'); 
ylabel('Error');
xlim([6 10^3]);
xticks([6 10 100 1000]);
yticks([10^(-16) 10^(-12) 10^(-8) 10^(-4) 10^0]);
title('f(x) = e^x cos(x)');
legend('Tn','Sn','GL2n','GL3n','Location','southwest');