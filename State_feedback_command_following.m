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

%% LQ Optimal Control Design (Select Q and R
%% Matrices to Get Better Performance)

q1 = 10; % Enter a Value (for example, you can start with q1 = 1)
q2 = 1; % Enter a Value (for example, you can start with q2 = 1)
q3 = 1; % Enter a Value (for example, you can start with q3 = 1)
q4 = 1; % Enter a Value (for example, you can start with q4 = 1)

Q=diag([q1 q2 q3 q4]); % A Diagonal Q Matrix

r1 = 1; % Enter a Value (for example, you can start with r1 = 1)

R=diag(r1); % A Diagonal R Matrix

P=are(A,B*inv(R)*B',Q); % Solve Algebraic Riccati Equation

K1=inv(R)*B'*P % Optimal Control Gain K

I=eye(4);

K2=-1/(C*inv(A-B*K1)*B)

%% Simulate Your LQ Optimal Control Design

beta=0.5

tf=7; dt=0.001; t=0; 
x0=[0; 0; 0; 0]; x=x0; y=0;
X=[];  T=[]; U=[]; Y=[];
ind=1;
while (t<=tf)
    T=[T;t]; X=[X,x]; Y=[Y,y];
    c=cos(beta*t);
    u=-K1*x + K2*c; U=[U,u];
    x=x+dt*(A*x+B*u);
    y=C*x;
    c_rec(ind,1) = c;
    t=t+dt;
    ind=ind+1;
end

figure();
subplot(2,1,1); 
plot(T,X,T,c_rec,'r--');
ylabel('system states (x)');
legend('\theta','\alpha','\theta dot','\alpha dot','c');
subplot(2,1,2); 
plot(T,U);
ylabel('control signals (u)');
xlabel('time (sec)');
legend('u');

figure();
plot(T,Y,T,c_rec,'r--');
ylabel('output (y)');
xlabel('time (sec)');
legend('y','command c');
