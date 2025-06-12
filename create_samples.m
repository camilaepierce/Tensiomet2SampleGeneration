% Iteratively create data samples

% Save current parameters to be used in script
% Run example_simple forward script
N = 999; %number of drops to generate


% Keeping track of Ar - Wo combinations that converge / don´t
Ar_array = zeros(N, 1, "double");
Wo_array = zeros(N, 1, "double");
converged = zeros(N, 1, "double");

% Run randomization script N times
for i = 1:N
    try
        disp(i);
        % axis off % removes axes from graph for image collection
        example_simple;
        % Plot current shape
        plot_shape_full(vars_sol.r, vars_sol.z, 1);
        % Save image to folders
        saveas(gcf, sprintf("./sample_generation/test_images/%03d.png", i));
        % Save data to folders
        writematrix([vars_sol.z vars_sol.r], sprintf("./sample_generation/test_data_rz/rz%03d.txt", i));
        writestruct(params_phys, sprintf("./sample_generation/test_data_params/params%03d.json", i), FileType="json");
        converged(i) = 2;
    catch
       disp(["unable to converge with Wo=", Wo, " and Ar=", Ar ]);
       % if i > 0 && mod(i,1)==0
          converged(i) = 1;
       % else
       %     error("Invalid index value for i: %s", string(i));
       % end
    end
    Ar_array(i) = Ar;
    Wo_array(i) = Wo;
end
close all
scatter(Ar_array, Wo_array, 10, converged, "filled")
colormap(gca, "abyss")
title("Convergence of Ar vs Wo in Pendant Drop Simulations")
xlabel("Aspect Ratio (Ar)")
ylabel("Worthington Number (Wo)")
xlim([1, 20])
ylim([1, 10])
saveas(gcf, "./sample_generation/ArWoConvergence.png");
