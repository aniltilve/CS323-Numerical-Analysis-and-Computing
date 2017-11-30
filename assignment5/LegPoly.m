function y = LegPoly(n,x)

if  n == 0
    y = 1;
elseif n == 1
    y = x;
else
    PnMinus1 = x;
    PnMinus2 = 1;
    
    for i = 2:n
        y = ((2*i-1).*x.*PnMinus1-(i-1).*PnMinus2)/i;
        PnMinus2 = PnMinus1;
        PnMinus1 = y;
    end
end