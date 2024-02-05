%% 指派问题（选择队员去进行游泳接力比赛）
clear; clc
c = [66.8, 75.6, 87, 58.6, 57.2, 66, 66.4, 53, 78, 67.8, 84.6, 59.4, 70, 74.2, 69.6, 57.2, 67.4, 71, 83.8, 62.4]'; % 目标函数的系数矩阵（先列后行的写法）
intcon = [1:20]; % 整数变量的位置（一共 20 个决策变量，均为 0-1 整数变量）
% 线性不等式约束的系数矩阵和常数项向量（每个人只能入选四种泳姿之一，一共五个约束）
A = [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
    0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0; ...
    0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0; ...
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0; ...
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1];
% A = zeros(5, 20);
% for i = 1:5
%     A(i, (4 * i - 3):4*i) = 1;
% end
b = [1; 1; 1; 1; 1];
% 线性等式约束的系数矩阵和常数项向量 （每种泳姿有且仅有一人参加，一共四个约束）
Aeq = [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0; ...
    0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0; ...
    0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0; ...
    0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1];
% Aeq = [eye(4), eye(4), eye(4), eye(4), eye(4)]; % 或者写成 repmat(eye(4), 1, 5)
beq = [1; 1; 1; 1];
lb = zeros(20, 1); % 约束变量的范围下限
ub = ones(20, 1); % 约束变量的范围上限
% 最后调用 intlinprog() 函数
[x, fval] = intlinprog(c, intcon, A, b, Aeq, beq, lb, ub)
% reshape(x, 4, 5)'
%      0     0     0     1    甲自由泳
%      1     0     0     0    乙蝶泳
%      0     1     0     0    丙仰泳
%      0     0     1     0    丁蛙泳
%      0     0     0     0    戊不参加


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭