close all; clear all; clc;

%% 1. Read content and style images
style = imread('style.jpg');
content = imread('content.jpg');

%% 2. Adjust the distribution of color of content image to that of style image
content = cf_reinhard(content, style);

%% 3. Adjust the size of style image to 100x100
blocks = img2blocks(style, 100);
[idx, idy] = findColorBlock(style);
disp([idx, idy]);
% imshow(style(idx:idx+99, idy:idy+99,:));
new_style = style(idx:idx+99,idy:idy+99,:);
style = imresize(style, [100 100]);

%% 4. Apply texture transfer on content image
temp = size(content);
outSize1 = temp(1);
outSize2 = temp(2);
output = texture_transfer(content, new_style, outSize1, outSize2, 10, 5 , 0.1, 0.2);

%% 5. Write the result image
% imwrite(output, 'result.jpg');
