clear all;
clc;
I = imread('retina_images\1.tif');
I = imresize(I,.8);
figure, imshow(I);title('Input retina image');
input = rgb2gray(I);

gt1 = imread('label_images\1.tif');
gt1 = imresize(gt1,.8);
gt_image = im2bw(gt1);
figure, imshow(gt1);title('Ground truth image');


segmented_image = segmentRetina(input);

[P, N, T] = calculatePNT(segmented_image,gt_image);

%figure, imshow(gt_image);
figure, imshow(segmented_image);title('Segmented image');
fprintf('Value of P is : %.2f\n', P);
fprintf('Value of N is : %.2f\n', N);
fprintf('Value of T is : %.2f\n', T);
