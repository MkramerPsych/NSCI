%Problem 9: micro-SAT computations%

[sorted_rt, index] = sort (RT); %sort the RT times
sorted_Thresholds = zeros(1,150); %init list of thresholds

for i = 1:150 %populate sorted thresholds
    sorted_Thresholds(i) = Thresholds(index(i));
end

figure;
hold on;
xlim([0, 9]);
prop_pos = zeros(1,10);
prop_neg = zeros(1,10);

for i = 0:9 %window counter
    pos = 0;
    neg = 0;
    for a = 1:15 %index within window
        if sorted_Thresholds(i * 15 + a) == 1
            pos = pos + 1;
        else
            neg = neg + 1;
        end
        total = pos + neg; 
    end
    prop_pos(i+1) = pos / total;
    prop_neg (i+1) = neg / total;
end

plot(prop_pos, 'r.-') %plot prop of 1s

negOneCross = 0;
numNegCrosses = 0;
OneCross = 0;
numCrosses = 0;

for i = 1:150 %average RT for 1 trials and -1 trials
    if sorted_Thresholds(i) == 1
        OneCross = OneCross + sorted_rt(i);
        numCrosses = numCrosses + 1;
    else
        negOneCross = negOneCross + sorted_rt(i);
        numNegCrosses = numNegCrosses + 1;
    end
end
avgOneCross = OneCross / numCrosses;
avgOneNegCross = negOneCross / numNegCrosses;
disp(avgOneCross)
disp(avgOneNegCross)

