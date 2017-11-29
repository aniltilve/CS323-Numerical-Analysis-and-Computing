function B = NCS(x,y)

n = length(x);
u = (n-1)*4;
A = zeros(u);
Z = zeros(u,1);

%Fill upper half of A and Z
c = 1;
i = 1;
for r = 1:2:u/2-1
    A(r,c:c+3) = [x(i)^3, x(i)^2, x(i), 1];
    A(r+1,c:c+3) = [x(i+1)^3, x(i+1)^2, x(i+1), 1];
    Z(r) = y(i);
    Z(r+1) = y(i+1);
    i = i+1;
    c = c+4;
end

%Fill derivative constraints
r = u/2+1;
c = 1;
for i = 2:n-1
    A(r,c:c+2) = [3*x(i)^2, 2*x(i), 1];
    A(r,c+4:c+6) = [-3*x(i)^2, -2*x(i), -1];
    A(r+n-2,c:c+1) = [6*x(i), 2];
    A(r+n-2,c+4:c+5) = [-6*x(i), -2];
    r = r+1;
    c = c+4;
end

A(u-1,1:2) = [6*x(1), 2];
A(u,u-3:u-2) = [6*x(end), 2];

B = A\Z;