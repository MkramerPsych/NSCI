%NSCI 360 - Cognitive Neuroscience: Matlab Assignment 1
%I affirm that I have adhered to the honor code on this assignment
%Max Kramer

%%Level 2: Question 7%%
for I = 2:2:10
    disp(I)
end

%%Level 2: Question 8%%
Fs = 5000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector

S1 = 0.7*sin(2*pi*50*t);
S2 = sin(2*pi*120*t);
Sig1 = S1 + S2;

figure;
plot(50*t,Sig1);
title('Base Signal Sig1')
xlabel('t (milliseconds)')
ylabel('Amplitude')

%%Repeat with t step 0.001%%
Fs = 5000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:0.001:L-1)*T;  % Time vector

S1 = 0.7*sin(2*pi*50*t);
S2 = sin(2*pi*120*t);
Sig1 = S1 + S2;

figure;
plot(50*t,Sig1);
title('Base Signal Sig1prime')
xlabel('t (milliseconds)')
ylabel('Amplitude')


%%LEVEL 2: Question 9%%
Fs = 5000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector

S1 = 0.6*sin(2*pi*50*t+15) + randn(size(t));
S2 = 0.4*sin(2*pi*120*t+10) + randn(size(t));
S3 = 0.8*sin(2*pi*215*t+5) + randn(size(t));
Sig2 = S1 + S2 + S3;

figure;
plot(50*t,Sig2);
title('Base Signal Sig2')
xlabel('t (milliseconds)')
ylabel('Amplitude')

%%LEVEL 3: Question 10%%
%For Sig1%
X = Sig1;
Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure;
plot(f,P1);  
title('Power Spectrum Sig1')
xlabel('Frequency (Hz)')
ylabel('Power (Uv)')

%For Sig2%
X = Sig2;
Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure;
plot(f,P1);
title('Power Spectrum Sig2')
xlabel('Frequency (Hz)')
ylabel('Power (Uv)')

%%LEVEL 3: Question 11%%
Fs = 5000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1000;             % Length of signal
t = (0:L-1)*T;        % Time vector
Xfreq = 50;
Yfreq = 120;

S = 0.7*sin(2*pi*Xfreq*t) + sin(2*pi*Yfreq*t);
X = S + 2*randn(size(t));

figure;
plot(50*t,X);
title('Base Signal Sig3')
xlabel('Time (ms)')
ylabel('Amplitude ( )')

Y = fft(X);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure;
plot(f,P1);  
title('Power Spectrum Sig3')
xlabel('Frequency (Hz)')
ylabel('Power (Uv)')

%%LEVEL 3: Question 12%% %%MUST ABSTRACT TO MATRIX OF 20 TRIALS
interSpikeTimes = exprnd(1,20,50); %Generate interspike durations
t = cumsum(interSpikeTimes); %Generate list of spike times
histo = histogram(interSpikeTimes); %Histogram of interspike durations
title('Histogram of interspike durations')

[n,m] = size(t); %split t by trial
figure;
yst = 0;
ynd = 1;
for K = 1:n %for every trial
    r=t(K,:); %get each trial as a row
    for I = 1:length(r) %1 Trial of spikes
        line([r(I),r(I)],[yst,ynd])
    end
    yst = yst + 2;
    ynd = ynd + 2;
end



