function L = LegPolyApprox(X,n)

L = zeros(1,length(X));

for j = 0:n
    L(:) = L(:) + (j + 0.5) * integral(@(x) f(x) .* LegPoly(j,x), -1, 1) * LegPoly(j,X(:));
end