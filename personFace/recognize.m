clear;
clc;
load('Factor.mat');
videoFileReader = videoinput('winvideo');
videoFileReader.ReturnedColorSpace = 'grayscale';
T = vision.CascadeObjectDetector;
for i=1:50
    faceDetector = T;
    videoFrame      = getsnapshot(videoFileReader);
    bbox            = step(faceDetector, videoFrame);
    res = '未识别出来';
    if ~isempty(bbox)
        a = videoFrame(:,bbox(1,1):bbox(1,1)+bbox(1,3),:);
        Face = a(bbox(1,2):bbox(1,2)+bbox(1,4),:,:);
        [C,S] = wavedec2(Face,5,'coif5');%进行5层小波分解
        [h5, v5, d5] = detcoef2('all', C, S, 5);%提取5层的所有高频系数
        frequence_test=[h5(:);zeros(2025-length(h5(:)),1)];
        res = predict(Factor,frequence_test');
    end
    videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,res);
    imshow(videoOut), title('Detected face');
end
delete(videoFileReader);