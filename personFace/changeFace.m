clear
load('lincahoFace.mat');
allsamples=[];%所有训练图像
frequence_test=[];
test=[];
f=[];
train = cell(size(f,2),1);
for i=1:25
      a=imread(strcat('/home/panis/文档/workspace/face/image/',num2str(i),'.jpg'));
      a=rgb2gray(a);
      [C,S] = wavedec2(a,5,'coif5');%进行5层小波分解
      [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的所有高频系数
      frequence_test=[frequence_test,[h5(:);zeros(2025-length(h5(:)),1)]];
      f=[f,'A'];
      train{i}='A';
end

for i=26:30
      a=imread(strcat('/home/panis/文档/workspace/face/image/',num2str(i),'.jpg'));
      a=rgb2gray(a);
      [C,S] = wavedec2(a,5,'coif5');%进行5层小波分解
      [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的所有高频系数
      test=[test,[h5(:);zeros(2025-length(h5(:)),1)]];
end

for i=1:25
    a=b{i};
    [C,S] = wavedec2(a,5,'coif5');%进行5层小波分解
    [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的所有高频系数
    frequence_test=[frequence_test,[h5(:);zeros(2025-length(h5(:)),1)]];
    f=[f,'B'];
    train{i+25}='B';
end

for i=26:30
    a=b{i};
    [C,S] = wavedec2(a,5,'coif5');%进行5层小波分解
    [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的所有高频系数
    test=[test,[h5(:);zeros(2025-length(h5(:)),1)]];
end
    label_train = categorical(train);
    Factor = TreeBagger(700,frequence_test',label_train);
     [ans,proview] = predict(Factor,test');