function [idx,C,sumD,D] = MyKmeans(X,K,C0,numIter)
%X = n-by-p mat
%C0 = K-by-p mat

n = size(X,1);

%Preallocate outputs
idx = zeros(size(X,1),1); %n-by-1 col vec
C = C0; %K-by-p mat
sumd1 = zeros(K, 1); %K-by-1 col vec
sumD = zeros(1, numIter);
D = zeros(size(X,1),K); %n-by-K mat

for curIter=1:numIter
    D = pdist2(X,C,'squaredeuclidean');
    [~, idx] = min(D,[],2);
    sumPoints = 0;
    numPoints = 0;
    for j=1:K %for each row of C
        for i=1:n
            if (j == idx(i))
                sumPoints = sumPoints + X(i,:);
                numPoints = numPoints + 1;
            end
        end
        C(j,:) = sumPoints / numPoints;
        sumPoints = 0;
        numPoints = 0;
    end
    sumd1 = sum(D,1)';
    sumD(:, curIter) = sum(sumd1);
end