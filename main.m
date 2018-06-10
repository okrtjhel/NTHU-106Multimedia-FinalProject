close all; clear all; clc;

%% 1. Read content and style images
style = imread('style/style7.jpg');
content = imread('content/content2.jpg');

%% 2. Adjust the size of the style image to 100x100
scaledStyle = scalingImage(style);
[idx, idy] = findColorBlock(scaledStyle);
block_style = scaledStyle(idx : idx + 99, idy: idy + 99, :);

%% 3. Adjust the distribution of color of the content image to that of the style image
new_content = cf_reinhard(content, block_style);
% new_content = content;

%% 4. Apply texture transfer on the content image
temp = size(new_content);
outSize1 = temp(1);
outSize2 = temp(2);
transfer = texture_transfer(new_content, block_style, outSize1, outSize2, 10, 5 , 0.1, 0.2);

%% 5. Apply bilateral filter on the texture-transfered content image
w = 5;
sigma = [3, 0.1];
% output = bfilter2(transfer, w, sigma);
output = transfer;

%% 6. Write the result image
imshow(output);
imwrite(output, 'result.jpg');
