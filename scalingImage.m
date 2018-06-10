function scaledImage = scalingImage(originImage)
	[height, width, ~] = size(originImage);
	% decide scaling factor by letting the shorter edge close to 200
	% e.g. 600x400 --> 400/200 = 2 --> new image will be 300x200 by deviding 2
	scalingFactor = floor(min([height, width]) / 200);
	if(scalingFactor < 1)
		scalingFactor = 1;
	end
	scaledImage = imresize(originImage, 1/scalingFactor);
end