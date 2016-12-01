function M = AddData(M,n)
for i=n:n:size(M,2)
    if size(M,2)==400
        break;
    end
    M = [M(:,1:i),(M(:,i)+M(:,i+1))/2,M(:,i+1:end)];
end
end