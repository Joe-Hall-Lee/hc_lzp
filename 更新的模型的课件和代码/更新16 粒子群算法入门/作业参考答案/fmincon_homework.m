%% 求解函数 y = 21.5 + x(1) * sin(4*pi*x(1)) + x(2) * sin(20*pi*x(2)) 在 x1 属于 [-3, 12.1]，x2 属于 [4.1, 5.8] 内的最大值
% 目标函数参考的最优值：38.8503
x0 = [11.6, 5.7]; % 这里的初始值如果取得偏离一点，结果就可能千差万别
A = [];
b = [];
Aeq = [];
beq = [];
x_lb = [-3, 4.1]; % x 的下界
x_ub = [12.1, 5.8]; % x 的上界
[x, fval] = fmincon(@Obj_fun_1, x0, A, b, Aeq, beq, x_lb, x_ub)
fval = -fval