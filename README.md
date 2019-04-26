# reitna-segmentation
Segmentation of retina image to extract complex structure of blood vessel

For detail see : https://medium.com/@gautamkumarjaiswal/retina-blood-vessel-segmentation-using-matlab-ce5cfd1fa974

Usage:
Run mainDemo.m

Steps 1: Read retina image in matlab workspace from folder ‘retina_images\1.tif’.

Step 2: Apply segmentation algorithm to input retina image.

ISODATA algorithm is used to segment blood vessel from retina image. An ISODATA Compute global image threshold using iterative isodata method.   LEVEL = ISODATA(I) computes a global threshold (LEVEL) that can be  used to convert an intensity image to a binary image with IM2BW. LEVEL  is a normalized intensity value that lies in the range [0, 1].  This iterative technique for choosing a threshold was developed by Ridler and Calvard.
Segmented image of retina: 

Step 3: Load ground-truth image (label_images/1.tif) to compare result of segmentation algorithm. Now we have two images. i.e one is ground truth and another is segmented result. To compare the performance of algorithm we calculated ‘true retina’ and ‘false retina’ as well as ‘true background’ and ‘false background’.

Following code section shows the calculation of above parameters

number_of_pixels_gt = numel(gt);
number_of_retina_pixels_gt = sum(gt(:) == 1);
number_of_background_pixels_gt = number_of_pixels_gt - number_of_retina_pixels_gt;
 
number_of_pixels_segmented = numel(seg);
number_of_retina_pixels_segmented = sum(seg(:) == 1);
number_of_background_pixels_segmented = number_of_pixels_segmented - number_of_retina_pixels_segmented;
 
 and_op = gt & seg; 
 or_op = or(gt,seg);
 
 
 number_of_true_retina_pixels = sum(and_op(:) == 1);
 number_of_true_background_pixels = sum(or_op(:) == 0);


Based on parameters calculated above, we calculated value pf P, N and T using following code:

P = (number_of_true_retina_pixels/number_of_retina_pixels_gt)*100;
N = (number_of_true_background_pixels/number_of_background_pixels_gt)*100;
T = ((number_of_true_retina_pixels+number_of_true_background_pixels)/number_of_pixels_gt)*100;


RESULT : 

Value of P is : 56.71
Value of N is : 99.31
Value of T is : 95.5

Change image file to test other retina image in the task3main.m file.

I = imread('retina_images\1.tif');
gt1 = imread('label_images\1.tif');

and run matlab code for another image. NOTE: take care that input image and label image should be same.

Reference:

[1] T.W. Ridler, S. Calvard, Picture thresholding using an iterative selection method, IEEE Trans. System, Man and Cybernetics, SMC-8 (1978) 630-632.

