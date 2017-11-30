function DisplayZip

zip = feval('load', 'zip.train');

ind = randsample(size(zip,1),8);
figure; 
for n = 1:length(ind)
    for i = 1:16
        for j = 1:16
            im(i,j) = zip(ind(n),1+(i-1)*16+j);
        end
    end
    subplot(2,4,n);
    imagesc(im);title(num2str(zip(ind(n),1)));axis off; 
end
