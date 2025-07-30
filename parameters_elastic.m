
% Set min/max of parameters for random variables
Kmod_min = 1;
Kmod_max = 20;
% Gmod_min = 1;
% Gmod_max = 1000;

% dimensionfull input parameters
% physical parameters for the elastic problem
params_phys.Kmod = (rand * (Kmod_max - Kmod_min)) + Kmod_min;          % elastic dilational modulus, originally 3
params_phys.Gmod = randsample([1, 10, 100, 1000], 1); % (rand * (Gmod_max - Gmod_min)) + Gmod_min;          % elastic shear modulus, originally 2
params_phys.compresstype = 2;  % 1: compress the volume other: compress the area
params_phys.frac  = randsample([0.8, 0.9], 1);       % (rand * (.9 - .8)) + .8;          % [0.8, 0.9] compute elastic stresses for this compression
params_phys.strainmeasure = 'pepicelli'; % which elastic constitutive model