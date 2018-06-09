function [m,n] = findColorBlock(content)
	[h,w,~] = size(content);
	m = 1;
	n = 1;
	maximum = 99999;
	for y = 1:10:h-100+1
		for x = 1:10:w-100+1;
			his = histcounts(content(y:y+99,x:x+99),256);
			block_max = max(his);
			if(block_max < maximum)
				maximum = block_max;
				m = y;
				n = x;
			end
		end
	end
end