function [u] = backstepping_ctrl(x)
    u = -2*x(2)+2*x(1)^3-2*x(1)+3*x(1)^2*x(2)-3*x(1)^5;
end

