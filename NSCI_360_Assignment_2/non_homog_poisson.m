%Problem 12: Non Homogenous Poisson%

function non_homog_poisson()

figure;
hold on;

%prepare variables
drate = 3; %no of changes in firing rate
trials = 10; %trials
number_of_spikes = 30; %spikes per trial
y = trials; %for plotting 
firing_rate = [ 3 11 7 ]; %three separate firing rates
sti = zeros(1,number_of_spikes); %instantiate indices

for i = 1:number_of_spikes %populate spike time indices
    sti(i) = i;
end

%plot one trial with rate changes
for trial = 1:trials %iterate through trials
    times = zeros(1,number_of_spikes*3);
    
    for rate_change = 1:drate %apply changes to firing rates
        isd = exprnd(firing_rate(rate_change),1,number_of_spikes); %gen interspike durations
       
        for spike = 1:length(isd)
            times(sti(spike)) = isd(spike);
        end
        
        for index = 1:length(sti)
            sti(index) = index + number_of_spikes;
        end
    end
    
    times = cumsum(times); %create spike times from cumsum of isds
    
    for spike = 1:number_of_spikes*3
        plot([ times(spike),times(spike) ],[y-1 y]);
        xlim([0, 300]);
        ylim([0,10]);
    end
    
    y = y - 1;

end

figure;
histogram(times)