function dx = fun1(t, x) % 大家可以修改里面的参数，来看结果的变化
beta = 0.1; % 易感染者与已感染者接触且被传染的强度
gamma = 0.02; % 康复率
dx = zeros(3, 1); % x(1) 表示 S，x(2) 表示 I，x(3) 表示 R
C = x(1) + x(2); % 传染病系统中的有效人群，也就是课件中的 N' = S + I
dx(1) = -beta * x(1) * x(2) / C;
dx(2) = beta * x(1) * x(2) / C - gamma * x(2);
dx(3) = gamma * x(2);
end