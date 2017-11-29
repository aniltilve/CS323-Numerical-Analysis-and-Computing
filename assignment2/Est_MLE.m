function N11_est = Est_MLE(n11,n12,n21,n22,M1,M2,N,iter)

N11_est = zeros(iter,1);
N11_est(1) = n11/(n11 + n12 + n21 + n22) * N;

for i = 2:iter
   D1 = M1 - N11_est(i-1);
   D2 = M2 - N11_est(i-1);
   D3 = N - M1 - M2 + N11_est(i-1);
   
   gN11 = n11/N11_est(i-1) - n12/D1 - n21/D2 + n22/D3;
   gPrimeN11 = -n11/(N11_est(i-1)^2) - n12/D1^2 - n21/D2^2 - n22/D3^2;
   N11_est(i) = N11_est(i-1) - gN11/gPrimeN11;
end 

