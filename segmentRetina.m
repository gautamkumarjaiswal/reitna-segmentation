function segimg = segmentRetina(I)
%I = imread('1_org.tif');
% Resize image for easier computation
%B = imresize(I, [584 565]);
[r,c, ch] = size(I);
B = imresize(I, [r c]);
                    % Read image
gray = im2double(B);
%im(:,:,4) = [];


%gray = rgb2gray(im);
%% Contrast Enhancment of gray image using CLAHE
J = adapthisteq(gray,'numTiles',[8 8],'nBins',128);
%% Background Exclusion                    % Apply Average Filter
 h = fspecial('average', [9 9]);
 JF = imfilter(J, h);
 %figure, imshow(JF)
 % Take the difference between the gray image and Average Filter
Z = imsubtract(JF, J);
%figure, imshow(Z);
%% Threshold using the IsoData Method
level=isodata(Z); % this is our threshold level
%level = graythresh(Z)
 %% Convert to Binary
BW = im2bw(Z, level-.008);
%% Remove small pixels
 BW2 = bwareaopen(BW, 100);
 
%% Overlay
BW2 = imcomplement(BW2);
out = imoverlay(B, BW2, [0 0 0]);
%figure, imshow(out)
           
vv = rgb2gray(out);
binaryImage = vv > 60;
%figure,imshow(binaryImage)
%fullFileName = fullfile(output, baseFileNames(f).name);
                   
BW2 = bwmorph(binaryImage,'clean');
%figure, imshow(BW2);
%imwrite(BW2, fullFileName);
segimg = BW2;
end