function M = standardMatrix(M)
n=400;
a = size(M);
if a(1)>n
    M = DelateData(M,floor(a(1)/(a(1)-n)));
elseif a(1)<n
    M = AddData(M,floor(a(1)/(n-a(1))));
end
if a(2)>n
    M = DelateData(M',floor(a(2)/(a(2)-n)))';
elseif a(2)<n
    M = AddData(M',floor(a(1)/(n-a(2))))';
end
end