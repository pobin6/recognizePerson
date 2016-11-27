clear all;
close all;
clc;

obj=videoinput('winvideo');       %一般的家用摄像头第三个参数这样就可以，不能运行直接去掉第三个参数也可以
h1=preview(obj);                 %预览视频，同时获取句柄  
h2=figure(2);                    %新建显示图像figure,同时获取句柄
faceDetector = vision.CascadeObjectDetector();
while ishandle(h1) && ishandle(h2)              %两个句柄有一个关闭就结束程序
     frame=getsnapshot(obj);     %捕获图像
    frame=rgb2gray(frame);     %转成彩色,这个frame就可以按照自己意愿处理了
    bbox = faceDetector.step(frame);
    videoOut = insertObjectAnnotation(frame,'rectangle',bbox,'Face');
    imshow(frame);              %显示图像
    drawnow;                    % 实时更新图像
end

delete(obj);                %删除对象