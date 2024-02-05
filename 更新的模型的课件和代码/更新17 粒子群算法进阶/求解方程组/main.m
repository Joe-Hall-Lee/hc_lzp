%% ��1������ 14 ������ vpasolve ����
clear; clc
syms x1 x2 x3
eqn = [abs(x1+x2) - abs(x3) == 0, x1 * x2 * x3 + 18 == 0, x1^2 * x2 + 3 * x3 == 0]
[x1, x2, x3] = vpasolve(eqn, [x1, x2, x3], [0, 0, 0])
[x1, x2, x3] = vpasolve(eqn, [x1, x2, x3], [1, 1, 1]) % ��һ����ʼֵ����

%% ��2������ 14 ������ fsolve ����
x0 = [0, 0, 0]; % ��ʼֵ
x = fsolve(@my_fun, x0)
% ��һ����ʼֵ����
x0 = [1, 1, 1]; % ��ʼֵ
format long g % ��ʾ�����С��λ��
x = fsolve(@my_fun, x0)

%% ��3������Ⱥ�㷨�����Գ��Զ�Σ��п����ҵ�����⣩
clear; clc
narvs = 3;
% ʹ������Ⱥ�㷨������Ҫָ����ʼֵ��ֻ��Ҫ����һ�������ķ�Χ
lb = -10 * ones(1, 3);
ub = 10 * ones(1, 3);
options = optimoptions('particleswarm', 'FunctionTolerance', 1e-12, 'MaxStallIterations', 100, 'MaxIterations', 20000, 'SwarmSize', 100);
[x, fval] = particleswarm(@Obj_fun, narvs, lb, ub, options)


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ