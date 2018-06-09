close all; clear all; clc;

%% 1. Read content and style images
style = imread('style/style3.jpg');
content = imread('content/content2.jpg');

%% 2. Adjust the distribution of color of the content image to that of the style image
new_content = cf_reinhard(content, style);

%% 3. Adjust the size of the style image to 100x100
[idx, idy] = findColorBlock(style);
block_style = style(idx : idx + 99, idy: idy + 99, :);

%% 4. Apply texture transfer on the content image
temp = size(new_content);
outSize1 = temp(1);
outSize2 = temp(2);
transfer = texture_transfer(new_content, block_style, outSize1, outSize2, 10, 5 , 0.1, 0.2);

%% 5. Apply bilateral filter on the texture-transfered content image
w = 5;
sigma = [3, 0.1];
output = bfilter2(transfer, w, sigma);

%% 6. Write the result image
imshow(output);
imwrite(output, 'result.jpg');
