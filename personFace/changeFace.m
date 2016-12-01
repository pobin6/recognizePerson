clear
load('lincahoFace.mat');
load('fuyipeng.mat');
allsamples=[];%�?��训练图像
frequence_test=[];
test=[];
f=[];
train = cell(size(f,2),1);
for i=1:20
      [C,S] = wavedec2(fuyipeng{i},5,'coif5');%进行5层小波分�?
      [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的�?��高频系数
      frequence_test=[frequence_test,[h5(:);zeros(2025-length(h5(:)),1)]];
      f=[f,'fu'];
      train{i}='fu';
end

for i=21:24
      [C,S] = wavedec2(fuyipeng{i},5,'coif5');%进行5层小波分�?
      [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的�?��高频系数
      test=[test,[h5(:);zeros(2025-length(h5(:)),1)]];
end

for i=1:20
    a=b{i};
    [C,S] = wavedec2(a,5,'coif5');%进行5层小波分�?
    [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的�?��高频系数
    frequence_test=[frequence_test,[h5(:);zeros(2025-length(h5(:)),1)]];
    f=[f,'lin'];
    train{i+20}='lin';
end

for i=21:30
    a=b{i};
    [C,S] = wavedec2(a,5,'coif5');%进行5层小波分�?
    [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的�?��高频系数
    test=[test,[h5(:);zeros(2025-length(h5(:)),1)]];
end
    label_train = categorical(train');
    Factor = TreeBagger(700,frequence_test',label_train);
     [ans,proview] = predict(Factor,test');