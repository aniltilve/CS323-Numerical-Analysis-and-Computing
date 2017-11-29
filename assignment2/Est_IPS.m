function N11_est = Est_IPS(n11,n12,n21,n22,M1,M2,N,iter)

for i = 1 : iter
    row1sum = n11+n12;
    row2sum = n21+n22;
    
    N11 = n11 / row1sum * M1;
    N12 = n12 / row1sum * M1;
    N21 = n21 / row2sum * M1;
    N22 = n22 / row2sum * M1;
    
    n11 = N11;
    n12 = N12;
    n21 = N21;
    n22 = N22;
    
    col1sum = n11 + n21;
    col2sum = n12 + n22;
    
    N11 = n11 / col1sum * M2;
    N12 = n12 / col2sum * M2;
    N21 = n21 / col1sum * M2;
    N22 = n22 / col2sum * M2;
    
    n11 = N11;
    n12 = N12;
    n21 = N21;
    n22 = N22;
    N11_est(i) = N11;
end