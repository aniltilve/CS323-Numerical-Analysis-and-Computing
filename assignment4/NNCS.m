function B = NNCS(x,y)

n = length(x);
t = n-2;
u = 4*(n-3);
A = zeros(u);
Z = zeros(u,1);

%Fill the first and last two upper rows of A and Z
for i = 1:2
    A(i, 1:4) = [x(i)^3, x(i)^2, x(i), 1];
    A(i+t*2-2, u-3:u) = [x(i+t)^3, x(i+t)^2, x(i+t), 1];
    Z(i) = y(i);
    Z(i+t*2-2) = y(i+t);
end

%Fill remaining 2(n-4) upper rows
r = 3;
c = 1;
for i = 3:t
    A(r, c:c+3) = [x(i)^3, x(i)^2, x(i), 1];
    A(r+1, c+4:c+7) = [x(i)^3, x(i)^2, x(i), 1];
    Z(r) = y(i);
    Z(r+1) = y(i);
    r = r+2;
    c = c+4;
end

%Fill derivative constraints
r = 2*t+1;
c = 1;
for i = 3:t
    A(r,c:c+2) = [3*x(i)^2, 2*x(i), 1];
    A(r,c+4:c+6) = [-3*x(i)^2, -2*x(i), -1];
    A(r+(t-2),c:c+1) = [6*x(i), 2];
    A(r+(t-2),c+4:c+5) = [-6*x(i), -2];    
    r = r+1;
    c = c+4;
end

B = A\Z;