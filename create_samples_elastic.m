% Iteratively create data samples

% Save current parameters to be used in script
% Run example_simple forward script
N = 1; %number of drops to generate


% Keeping track of Ar - Wo combinations that converge / don´t
% Ar_array = zeros(N, 1, "double");
% Wo_array = zeros(N, 1, "double");
% converged = zeros(N, 1, "double");
% kmod_array = zeros(N, 1, "double");
% gmod_array = zeros(N, 1, "double");
% frac_array = zeros(N, 1, "double");
warning('off')
% Run randomization script N times
for i = 2:2
    try
        disp(i);
        % axis off % removes axes from graph for image collection
        example_elastic;
        % Plot current shape
        plot_shape_full(vars_sol.r, vars_sol.z, 1);
        % Save image to folders
        saveas(gcf, sprintf("./sample_generation/test_images/%d.png", i));
        % Save data to folders
        writematrix([vars_sol.z vars_sol.r], sprintf("./sample_generation/test_data_rz/rz%d.txt", i));
        writestruct(params_phys, sprintf("./sample_generation/test_data_params/params%d.json", i), FileType="json");
        writematrix([vars_sol.sigmas, vars_sol.sigmap], sprintf("./sample_generation/test_data_sigmas/sigma%d.txt", i))
        % converged(i) = 2;
    catch
       disp(["unable to converge with Wo=", Wo, " and Ar=", Ar , "Kmod=", params_phys.Kmod, "Gmod=", params_phys.Gmod, "compression", params_phys.frac]);
       % if i > 0 && mod(i,1)==0
          % converged(i) = 1;
       % else
       %     error("Invalid index value for i: %s", string(i));
       % end
    end
    % Ar_array(i) = Ar;
    % Wo_array(i) = Wo;
    % kmod_array(i) = params_phys.Kmod;
    % gmod_array(i) = params_phys.Gmod;
    % frac_array(i) = params_phys.frac;

end
% close all
% scatter(Ar_array, Wo_array, 10, converged, "filled")
% colormap(gca, "abyss")
% title("Convergence of Ar vs Wo in Pendant Drop Simulations")
% xlabel("Aspect Ratio (Ar)")
% ylabel("Worthington Number (Wo)")
% xlim([1, 20])
% ylim([1, 10])
% saveas(gcf, "./sample_generation/ArWoConvergence.png");
% 
% 
% clf;
% scatter(kmod_array, gmod_array, 10, converged, "filled")
% colormap(gca, "abyss")
% title("Convergence of Kmod vs Gmod in Pendant Drop Simulations")
% xlabel("Kmod")
% ylabel("Gmod")
% saveas(gcf, "./sample_generation/KGModConvergence.png");
% clf;
% scatter(kmod_array, frac_array, 10, converged, "filled")
% colormap(gca, "abyss")
% title("Convergence of Kmod vs fraction compression in Pendant Drop Simulations")
% xlabel("Kmod")
% ylabel("Fraction")
% saveas(gcf, "./sample_generation/KModFracConvergence.png");

disp("Done!")