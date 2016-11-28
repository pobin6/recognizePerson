clear;
clc;
videoFileReader = videoinput('winvideo');
videoFileReader.ReturnedColorSpace = 'grayscale';
b=cell(1,50);
for i=1:50
    faceDetector = vision.CascadeObjectDetector();
    bbox = [];
    while isempty(bbox)
        videoFrame      = getsnapshot(videoFileReader);
        bbox            = step(faceDetector, videoFrame);
    end
    a = videoFrame(:,bbox(1):bbox(1)+bbox(3),:);
    b{i} = a(bbox(2):bbox(2)+bbox(4),:,:);
    c=b{i};
    imshow(c), title('Detected face');
end
delete(videoFileReader);