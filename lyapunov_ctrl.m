function [u] = lyapunov_ctrl(x)
    u = -2*(x(1) + x(2));
end

