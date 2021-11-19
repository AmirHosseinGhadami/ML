function [y] = fitness(x1,x2)
% This function is the two dimensions Ackley function...
% x1 & x2 are the variables

    y = -20*exp(-0.2*sqrt(0.5*(x1^2+x2^2)))...
        -exp(0.5*(cos(2*pi*x1)+cos(2*pi*x2)))+exp(1)+20;
end

