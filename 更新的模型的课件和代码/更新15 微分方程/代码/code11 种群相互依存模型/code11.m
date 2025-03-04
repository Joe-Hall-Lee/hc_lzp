clc; clear
% 情况一：甲可以独自生存，乙不能独自生存
[t, x] = ode45('fun1', [0, 50], [80, 100]);
figure(1)
plot(t, x(:, 1), 'r-', t, x(:, 2), 'b-') % x 的第一列是甲种群数量，x 的第二列是乙种群数量
legend('种群甲', '种群乙')

% 情况二：甲乙均可以独自生存
[t, x] = ode45('fun2', [0, 50], [80, 100]);
figure(2)
plot(t, x(:, 1), 'r-', t, x(:, 2), 'b-') % x 的第一列是甲种群数量，x 的第二列是乙种群数量
legend('种群甲', '种群乙')

% 情况三：甲乙均不能独自生存
[t, x] = ode45('fun3', [0, 50], [80, 100]);
figure(3)
plot(t, x(:, 1), 'r-', t, x(:, 2), 'b-') % x 的第一列是甲种群数量，x 的第二列是乙种群数量
legend('种群甲', '种群乙')

% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭