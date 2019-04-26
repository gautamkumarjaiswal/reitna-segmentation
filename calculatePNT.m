function [P, N, T] = calculatePNT(seg,gt)
%clear all;
%clc;
%gt1 = imread('1_lab.tif');
%gt = im2bw(gt1);
%seg = imread('1_seg.tif');

%calculated ‘true retina’ and ‘false retina’ as well as ‘true background’ and ‘false background’.

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
 
 P = (number_of_true_retina_pixels/number_of_retina_pixels_gt)*100;
 N = (number_of_true_background_pixels/number_of_background_pixels_gt)*100;
 T = ((number_of_true_retina_pixels+number_of_true_background_pixels)/number_of_pixels_gt)*100;
 
end
 
 
 