clear; clc
global x y; % �� x �� y ����Ϊȫ�ֱ������������Ӻ�����ֱ�ӵ��ã�Ҫ��������
load data_x_y % ���ݼ��������� x �� y ��������
narvs = 2;
% ʹ������Ⱥ�㷨������Ҫָ����ʼֵ��ֻ��Ҫ����һ�������ķ�Χ
lb = [-10, -10];
ub = [10, 10];
[k, fval] = particleswarm(@Obj_fun, narvs, lb, ub)

% ʹ������Ⱥ�㷨�������� fmincon ����������
options = optimoptions('particleswarm', 'HybridFcn', @fmincon);
[k, fval] = particleswarm(@Obj_fun, narvs, lb, ub, options)


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ