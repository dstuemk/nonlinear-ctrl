%% Simulation parameters
K = 1000; % Number of runs
N = 2000; % Number of iterations
dt = 1e-3;

%% Storage for state and control values
X_backstepping = zeros(2,N,K);
X_dot_backstepping = zeros(2,N,K);
U_backstepping = zeros(N,K);

X_lyapunov = zeros(2,N,K);
X_dot_lyapunov = zeros(2,N,K);
U_lyapunov = zeros(N,K);

%% Simulate K runs
for i=1:K
    % Initial value
    X = rand(2,1)*2 - [1;1];
    X_backstepping(:,1,i) = X;
    X_lyapunov(:,1,i) = X;
    
    % Simulate single runs
    for k=2:N
        % Backstepping control
        u_backstepping = backstepping_ctrl(X_backstepping(:,k-1,i));
        U_backstepping(k-1,i) = u_backstepping;
        X_dot_backstepping(:,k-1,i) = system_dynamics(X_backstepping(:,k-1,i),u_backstepping);
        X_backstepping(:,k,i) = X_backstepping(:,k-1,i) + dt*X_dot_backstepping(:,k-1,i);
        
        % Lyapunov control
        u_lyapunov = lyapunov_ctrl(X_lyapunov(:,k-1,i));
        U_lyapunov(k-1,i) = u_lyapunov;
        X_dot_lyapunov(:,k-1,i) = system_dynamics(X_lyapunov(:,k-1,i),u_lyapunov);
        X_lyapunov(:,k,i) = X_lyapunov(:,k-1,i) + dt*X_dot_lyapunov(:,k-1,i);
    end
end

%% Plotting
color1 = [255, 0, 255]/255;
color2 = [255, 255, 0]/255;
colors_p = [ ...
    linspace(color1(1),color2(1),K)', ...
    linspace(color1(2),color2(2),K)', ...
    linspace(color1(3),color2(3),K)'];

figure
for ctrl=0:1
    % ctrl = 0 => backstepping, ctrl = 1 => lyapunov
    if ctrl == 0
        X = X_backstepping;
        X_dot = X_dot_backstepping;
        U = U_backstepping;
        plot_title = "Backstepping";
    elseif ctrl == 1
        X = X_lyapunov;
        X_dot = X_dot_lyapunov;
        U = U_lyapunov;
        plot_title = "Lyapunov";
    end
    % Cut of last value
    X(:,end,:) = [];
    X_dot(:,end,:) = [];
    U(end,:) = [];
    % Time axis
    t = (1:size(U,1)) * dt;
    % Generate subplots
    subplot(2,3,1+ctrl*3)
    hold on
    for i=1:K
        plot(X(1,:,i),X(2,:,i),'color',colors_p(i,:));
    end
    xlabel("x_1")
    ylabel("x_2")
    set(gca,'Color','k');
    subplot(2,3,2+ctrl*3)
    hold on
    for i=1:K
        plot(X_dot(1,:,i),X_dot(2,:,i),'color',colors_p(i,:));
    end
    xlabel("$\dot{x}_1$",'interpreter','latex')
    ylabel("$\dot{x}_2$",'interpreter','latex')
    title(plot_title);
    set(gca,'Color','k');
    subplot(2,3,3+ctrl*3)
    hold on
    for i=1:K
        plot(t,U(:,i),'color',colors_p(i,:));
    end
    xlabel("t");
    ylabel("u");
    set(gca,'Color','k');
end

% Save figure as picture
saveas(gcf,'phase-portrait.png');