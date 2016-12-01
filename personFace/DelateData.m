function M = DelateData(M,n)
t=0;
for i=n:n:size(M,2)
    if size(M,2)==400
        break;
    end
    M(:,i-t) = [];
    t=t+1;
end
end