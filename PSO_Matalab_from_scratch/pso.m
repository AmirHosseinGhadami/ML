clc
clear all
% initializing the population to X variable
% n variable is the amount of the population
n=50
X = 5 + (-5-5) .* rand(n,2);;

% Initializing pbest, number of population(num), dimention(dim) & velacity(v) 
pbest = X;
[num ,dim] = size(X);
v = zeros(num,dim);

% evaluate the fitness for each pbest
for i=1:length(pbest)
    x= pbest(i,:);
    pbest_fitness(i) = fitness(x(1),x(2));
end;

%initializing the gbest
[gbest_fit ,gbest_index] = min(pbest_fitness);
gbest = X(gbest_index,:);

%PSO
maxiter =100;

    

for i=1:maxiter
    
    rand1 = rand(num,dim);
    rand2 = rand(num,dim);
    
    %PSO formula
    v= v + 2*rand1.*(pbest-X)+ 2*rand2.*(gbest-X);
    
    %limit the velocityclea
    v  = min(max(v, -5), 5);
    
    %update the possitions
    X = X + v;
    
    %limit the positions
    X =min(max(X, -5), 5);
    
    % evaluate the fitness for each X
    for i=1:length(X)
        x= X(i,:);
        new_fit(i) = fitness(x(1),x(2));
    end;
    
    %Updating pbest and fit value
    index_new_pbest = new_fit < pbest_fitness;
    pbest_fitness(index_new_pbest) = new_fit(index_new_pbest);
    pbest(index_new_pbest,:) = X(index_new_pbest,:);
    
    %Updating gbest
    [Probable_gbest_fit ,Probable_gbest_index] = min(new_fit);
    if Probable_gbest_fit < gbest_fit
        gbest_fit = Probable_gbest_fit;
        gbest_index = Probable_gbest_index;
        gbest = X(gbest_index,:);
    end 
    disp('---------------------------------')
    disp(gbest_fit);

        
    
end 
