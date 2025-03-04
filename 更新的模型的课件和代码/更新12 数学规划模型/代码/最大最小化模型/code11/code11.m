%% 最大最小化模型：min{max[f1, f2, …, fm]}
x0 = [6, 6]; % 给定初始值
lb = [3, 4]; % 决策变量的下界
ub = [8, 10]; % 决策变量的上界
[x, feval] = fminimax(@Fun, x0, [], [], [], [], lb, ub)
max(feval)
% x =
% 
%                          8          8.50000000605316
% feval =
% 
%           13.5000000060532    5.49999999394684    5.50000000605316    12.4999999939468    8.50000000605316    8.50000000605316    5.50000000605316    13.4999999939468    9.50000000605316    0.49999999394684
% 结论：
% 在坐标为 (8, 8.50000000605316) 处建立供应中心可以使该点到各需求点的最大距离最小，最小的最大距离为 13.5000000060532 单位。


% % 注意：代码文件仅供参考，一定不要直接用于自己的数模论文中
% % 国赛对于论文的查重要求非常严格，代码雷同也算作抄袭