function thresholded_output_unit = neural_net( input_pattern )

% 11/2/12, PAS: This function is supposed to compute the output of a simple neural
% network. I have defined a weight matrix (with undefined weights), and I have 
% defined an input vector (input_pattern) and an output value (output_unit). 
% The output_unit value represents the 'activation' of two neural network units. 
% The user must specify an input pattern (assumed to be one of the following 
% vectors: [0;0], [0;1], [1;0], [1;1]). Use the 'figure' command at the command window
% prompt (>>) to open up a new figure window. Then type 'hold on' to allow you to plot
% multiple things in the window. Then call this function 4 times, once each with one 
% of the 4 possible input patterns.
 
output_unit = 0;% represents the level of activation in a single output unit, with an initial value of 0. 
                %You will overwrite this value a few lines down.

% The weight matrix (your job is to figure out what values to assign to a & b
% so as to compute the AND function).
weights = [1, 1];	% <-------- Fill in the values

output_unit = weights * input_pattern; % <--- Fill in the blank; i.e., assign something to output_unit

% Plot out the input vector as in Problem 4. You can assign colors by plotting this 
% way: 
% plot( [0, 1, 2 ], [4, 2, 3], 'r.-')
% The 'r.-' plots everything in red (r), with a little circle at the end (.) and 
% with a line connecting the different points (-). You can plot a dashed line with 
% (--) instead of (-). 
% Use 'r', 'g', 'b' and 'k' for your plotting colors.
	
	% ------ Place your code after this line ------ :

figure;
plot( [input_pattern(1), input_pattern(2)], 'r.-')

% There is one trick you will need, which is to convert your output_unit value to a  
% 1 or 0. You may find that the output_unit has an activation that is a
% decimal-valued number, depending on the weight values you chose for a and b.
%
% Here is one way to do the conversion, equivalent to applying a `threshold’ to 
% the values of the output_unit: If the value or activation of a unit is greater than 
% the threshold, you set it to 1. 

threshold = 2;

% Figure out how to convert graded values for output_units into 1s and 0s, using the
% threshold value above. Save the thresholded value of the output_unit in a new vector
% called `thresholded_output_unit’. Notice that this variable is what gets returned
% by this function.
	
	% ------ Place your code after this line ------ 

if output_unit < threshold
    thresholded_output_unit = 0;
end

if output_unit >= threshold
    thresholded_output_unit = 1;
end