%% ��������С������Ϻ��� lsqcurvefit
clear; clc
load data_x_y
k0 = [0, 0];
lb = [];
ub = [];
[k, fval] = lsqcurvefit(@fit_fun, k0, x, y, lb, ub)
% Choose between 'trust-region-reflective' (default) and 'levenberg-marquardt'.
options = optimoptions('lsqcurvefit', 'Algorithm', 'levenberg-marquardt');
[k, fval] = lsqcurvefit(@fit_fun, k0, x, y, lb, ub, options)


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ