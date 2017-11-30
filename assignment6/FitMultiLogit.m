function [err, loglik, err_t] = FitMultiLogit(X,Y,Xt,Yt,numIter,v,lam)

K = max(Y); d = size(X,2);  be = zeros(d,K);
Ye = zeros(length(Y),K); 
for k = 1:K
    Ye(:,k) = (Y==k);
end    
for m=1:numIter    
    iteration = m    
    F = X*be; 
    S= sum(exp(F),2);  
    for k = 1:K
        P(:,k) = exp(F(:,k))./S;
    end   
    for k = 1:K                         
        Z = (P(:,k).*(1-P(:,k))*ones(1,d).*X)'*X;
        be(:,k) = be(:,k) + (Z+lam*eye(d))\(X'*(Ye(:,k)-P(:,k))-be(:,k)*lam)*v;      
    end;    
    [~, Y_hat] = max(P,[],2);    
    err(m) = mean(Y_hat ~= Y);
    loglik(m) = sum(sum(log(P).*Ye,2));    
    
    Ft = Xt*be;    
    [~, Yt_hat] = max(Ft,[],2);   
    err_t(m) = mean(Yt_hat ~= Yt);
end
