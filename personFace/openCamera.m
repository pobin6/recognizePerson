%% Face Detection and Tracking Using CAMShift
% This example shows how to automatically detect and track a face.
%
%  Copyright 2014 The MathWorks, Inc.

%% Introduction
% Object detection and tracking are important in many computer vision
% applications including activity recognition, automotive safety, and
% surveillance. In this example, you will develop a simple face tracking
% system by dividing the tracking problem into three separate problems:
%
% # Detect a face to track
% # Identify facial features to track
% # Track the face

%% Step 1: Detect a Face To Track
% Before you begin tracking a face, you need to first detect it. Use the
% |vision.CascadeObjectDetector| to detect the location of a face in a
% video frame. The cascade object detector uses the Viola-Jones detection
% algorithm and a trained classification model for detection. By default,
% the detector is configured to detect faces, but it can be configured for
% other object types.
videoFileReader = videoinput('winvideo');
while true
    % Create a cascade detector object.
    faceDetector = vision.CascadeObjectDetector();
    bbox = [];
    while size(bbox,2) == 0
        videoFrame      = getsnapshot(videoFileReader);
        bbox            = step(faceDetector, videoFrame);
    end
    % Draw the returned bounding box around the detected face.
    videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');
    imshow(videoOut), title('Detected face');
end
% Release resources
delete(videoFileReader);