clear; clc
load mydata.mat % �������ݣ������У��ֱ��� S��I��R ��������
global true_s true_i true_r n % ����ȫ�ֱ���
n = size(mydata, 1); % һ���ж���������
true_s = mydata(:, 1);
true_i = mydata(:, 2);
true_r = mydata(:, 3);
figure(1)
plot(1:n, true_i, 'b-', 1:n, true_r, 'g-') % �������� I �� R ������
legend('I', 'R')

% ����Ⱥ�㷨�����
% beta1, beta2, a, b
% ����������������Χ��������Ŀ�����������ڿ���С��Χ
lb = [0, 0, -1, -1];
ub = [1, 1, 1, 1];
% lb = [0 0 -0.2 -0.2];
% ub = [0.3 0.3 0.2 0.2];
options = optimoptions('particleswarm', 'Display', 'iter', 'SwarmSize', 200);
[h, fval] = particleswarm(@Obj_fun, 4, lb, ub, options) % h ����Ҫ�Ż��Ĳ�����fval ��Ŀ�꺯��ֵ���ڶ���������� 4 ���������� 4 ��������Ҫ����

beta1 = h(1); % t <= 15 ʱ���׸�Ⱦ�����Ѹ�Ⱦ�߽Ӵ��ұ���Ⱦ��ǿ��
beta2 = h(2); % t > 15 ʱ���׸�Ⱦ�����Ѹ�Ⱦ�߽Ӵ��ұ���Ⱦ��ǿ��
a = h(3); % ������ gamma = a + bt
b = h(4); % ������ gamma = a + bt
[t, p] = ode45(@(t, x) SIR_fun(t, x, beta1, beta2, a, b), [1:n], [true_s(1), true_i(1), true_r(1)]);
p = round(p); % �� p �����������루����Ϊ������

figure(3) % ��ʵ����������ϵ������ŵ�һ�𿴿�
plot(1:n, true_i, 'b-', 1:n, true_r, 'g-')
hold on
plot(1:n, p(:, 2), 'b--', 1:n, p(:, 3), 'g--')
legend('I', 'R', '��ϵ�I', '��ϵ�R')

% Ԥ��δ��������
N = 27; % ���� N ��
[t, p] = ode45(@(t, x) SIR_fun(t, x, beta1, beta2, a, b), [1:N], [true_s(1), true_i(1), true_r(1)]);
p = round(p); % �� p �����������루����Ϊ������
figure(4)
plot(1:n, true_i, 'b-', 1:n, true_r, 'g-')
hold on
plot(1:N, p(:, 2), 'b--', 1:N, p(:, 3), 'g--')
legend('I', 'R', '��ϵ�I', '��ϵ�R')


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ������
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ