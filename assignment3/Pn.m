function P = Pn(X,x,y)

L = ones(length(X),length(x));

for i = 1:length(x)
    for j = 1:length(x)
        if (j ~= i)
            L(:,i) = L(:,i) .* (X' - x(j))/(x(i)-x(j));
        end
    end
end

P = y * L';