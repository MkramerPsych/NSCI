%Problem 10: Complex Neural Network%

function thresholded_output_unit = complex_net( input_pattern )

output_unit = 0;% represents the level of activation in a single output unit, with an initial value of 0. 
                %You will overwrite this value a few lines down.

% The weight matrix
weights = [ 1.6 0.5 0.5; -0.5 2.4 2.4 ];% <-------- Fill in the values

output_unit = weights * input_pattern; % <--- Fill in the blank; i.e., assign something to output_unit

% Figure out how to convert graded values for output_units into 1s and 0s, using the
% threshold value above. Save the thresholded value of the output_unit in a new vector
% called `thresholded_output_unit’. Notice that this variable is what gets returned
% by this function.

threshold = 2;

	% ------ Place your code after this line ------ 

if output_unit(1) > threshold
    output_unit(1) = 1;
else
    output_unit(1) = 0;
end

if output_unit(2) > threshold
    output_unit(2) = 1;
else
    output_unit(2) = 0;
end

thresholded_output_unit = output_unit;
