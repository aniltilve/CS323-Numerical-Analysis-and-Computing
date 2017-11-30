function P = Pn(X,x,y)

n = length(x)-1;
dX = ones(n+1,1)*X - x'*ones(1,length(X));

for k = 1:n+1
    i = [ 1:(k-1) (k+1):n+1];
    L(k,:) = prod(dX(i,:)./((x(k)-x(i))'*ones(1,length(X))));
end

P = sum(y'*ones(1,length(X)).*L);