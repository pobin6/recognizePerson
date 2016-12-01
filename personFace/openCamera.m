clear;
clc;
videoFileReader = videoinput('winvideo');
videoFileReader.ReturnedColorSpace = 'grayscale';
d=cell(1,50);
c=[];
n=1;
for i=1:50
    faceDetector = vision.CascadeObjectDetector();
    videoFrame      = getsnapshot(videoFileReader);
    bbox            = step(faceDetector, videoFrame);
    if ~isempty(bbox)
        a = videoFrame(:,bbox(1,1):bbox(1,1)+bbox(1,3),:);
        d{n} = a(bbox(1,2):bbox(1,2)+bbox(1,4),:,:);
        c=d{n};
        n=n+1;
        disp(n);
    end
    imshow(c), title('Detected face');
end
delete(videoFileReader);