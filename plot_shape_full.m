function [] = plot_shape_full(r, z, fig_num)
    % PLOT_SHAPE_MIRRORED Plots the shape profile in the (r, z) plane.
    %
    % INPUTS:
    %   r       - Radial coordinates.
    %   z       - Axial coordinates.
    %   fig_num - Figure number for plotting.

    figure(fig_num); hold on
    % plot(r, z,'-o');
    % plot(-r, z,'-o');
    fullShapeX = [r; -(flip(r)); r(1)];
    fullShapeY = [z; flip(z); z(1)];
    fill(fullShapeX, fullShapeY, "black")
    set(gca,'DataAspectRatio',[1 1 1])

end