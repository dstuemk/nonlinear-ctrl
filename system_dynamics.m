function [x_dot] = system_dynamics(x, u)
    x_dot = [x(2)-x(1)^3; u];
end

