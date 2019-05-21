%%LEVEL 3: TIME SOLUTIONS TO DYNAMIC SYSTEMS MODEL%%
%%Max Kramer - NSCI 360%%
%%NN_ode.m%%

%%V' = -V + f(I)%%
%%f(I) = 1./(1+exp(-4*( I - 0.5)))%%

%%Initialize timespan and I%%
Tspan = [0 100]; %window from 0 to 1000
I_t = linspace(Tspan(1),Tspan(2),25); % 25 equally spaced time steps
I_vals = sin(pi * I_t); %I is a sine wave
xinit = 0; %define initial value of x

%%Call ode45 and solve equation%%
[t,v] = ode45(@(t,v) ode(t,v,I_t,I_vals), Tspan, xinit); 

%%Plotting solutions%%
figure;
hold on;
plot(t,v); %Plot V(t) solution
plot(I_t,I_vals); %Plot sine wave input

%%Function to call%%
function dvdt = ode(t,v,I_t,I_vals) %Solve the equation dv/dt = -v + f(I) at time t
I_vals = interp1(I_t,I_vals,t); % get the value of I_vals at time t
dvdt = -v + 1./(1+exp(-4*( I_vals - 0.5))); % Evaluate ODE at time t
end

