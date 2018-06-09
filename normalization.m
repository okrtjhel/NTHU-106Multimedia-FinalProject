% Normalize the input image
function O = normalization(I)

    % Find the highest value of the input
    highest = max(max(max(I)));
    
    % Multiply (1 / highest) for each sample
    O = I / highest;
end