clc;
clear all;

%% System Matrices for a Distillation Process
%% of the Form dx/dt = Ax + Bu

A=[        0        0         1          0;
           0        0         0          1;
           0  149.2751   -0.0104         0;
           0  261.6091   -0.0103         0];
       
B=[0;
   0;
   49.7275;
   49.1494];

C=[1 0 0 0];

%% observer design
p = [-7 -9 -6 -4];
L = place(A',C',p)';

%% control design
% Q = diag([100 1]);   %10*eye(2);
% R = 0.1;
% K1 = lqr(A,B,Q,R)

% pole placement
K1 = place(A,B,[-30 -6 -5 -8])

Ao = A-L*C;
Ac = A-B*K1;
K2 = linsolve(-C*inv(Ac)*B,eye(1))
%% check
eigAo = eig(Ao)
eigAc = eig(Ac)

-C*inv(Ac)*B*K2

%% sim
dt = 0.01;
ft = 10;
beta=0.1;
x = [0.02; 0.04; -0.02; -0.04];
x_h = [0.1; 0.6; 0.3; 0.4];
ind = 1;
for t = 0:dt:ft
    y = C*x;
    c = cos(beta*t); %tracking command
    d = 0*[10; 10; 10; 10]; %disturbance
    
    u = -K1*x_h + K2*c;
    x_h = x_h + dt*(A*x_h + B*u + L*(y - C*x_h));
    x = x + dt*(A*x + B*u + d);
    
    
    t_rec(ind,1) = t;
    c_rec(ind,1) = c;
    x_rec(ind,1:4) = x;
    xh_rec(ind,1:4) = x_h;
    u_rec(ind,1) = u;
    ind = ind + 1;
end
    figure;
    plot(t_rec,x_rec,t_rec,c_rec,'r--',t_rec,xh_rec,'b:');
    xlabel('Time (s)')
    ylabel('system states (x)')
    legend('\theta','\alpha','\theta dot','\alpha dot','c');
    figure;
    plot(t_rec,x_rec(:,1),t_rec,xh_rec(:,1),'--')
    ylabel('system state x')
    legend('x1','x1_h');
    figure;
    plot(t_rec,u_rec);
    xlabel('Time (s)')
    ylabel('u(t)')
    legend('u');