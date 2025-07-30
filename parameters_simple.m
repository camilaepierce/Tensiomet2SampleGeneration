% % physical parameters for the simple droplet problem
% params_phys.sigma = 4;      % surface tension
% params_phys.grav = 1.2;     % gravitational acceleration
% params_phys.rneedle = 1.4;  % radius of the needle
% params_phys.volume0 = 16;   % prescribed volume
% params_phys.deltarho = 1.1; % density difference
% 
% % Worthington number (needed for initial shape guess)
% params_phys.Wo = params_phys.deltarho*params_phys.grav*...
%     params_phys.volume0/(2*pi*params_phys.sigma*params_phys.rneedle);


% Commented out the above, the belox is copied from
% parameters_simple_manuscript

% physical parameters for the simple droplet problem

% RANDOMIZING PARAMETERS
% Set random seed (seed 1 or default)

% Set min/max of parameters for random variables
Wo_min = 1;
Wo_max = 5;
Ar_min = 5;
Ar_max = 18;

% dimensionfull input parameters
Wo = 2.40147847319403; %(rand * (Wo_max - Wo_min)) + Wo_min;
Ar = 16.561011094609977; %(rand * (Ar_max - Ar_min)) + Ar_min;
sigma = 5;        % surface tension [mN/m]
grav = 9.807e3;    % gravitational acceleration [mm/s^2]
deltarho = 1e-3;   % density difference [10^6 kg/m^3]

% calculation of dimensionfull parameters
rneedle = sqrt((Wo*sigma/(deltarho*abs(grav)*Ar))); % radius of the needle [mm]
volume0 = Ar*rneedle^3;  % prescribed volume in mm^3

% dimensional input parameters, for saving
params_phys.sigma_dimal = sigma;
params_phys.grav_dimal = grav;
params_phys.rneedle_dimal = rneedle;
params_phys.volume0_dimal = volume0;
params_phys.deltarho_dimal = deltarho;

% dimensionless input parameters for calculation
params_phys.sigma = sigma/(deltarho*abs(grav)*rneedle^2); %%% save
params_phys.grav = grav/abs(grav);
params_phys.rneedle = rneedle/rneedle;
params_phys.volume0 = volume0/rneedle^3;
params_phys.deltarho = deltarho/deltarho;

% Worthington number (needed for initial shape guess)
params_phys.Wo = params_phys.deltarho*params_phys.grav*...
    params_phys.volume0/(2*pi*params_phys.sigma*params_phys.rneedle);

% Dimensionless numbers for the paper
params_phys.Wo_paper = Wo;
params_phys.Ar_paper = Ar;



