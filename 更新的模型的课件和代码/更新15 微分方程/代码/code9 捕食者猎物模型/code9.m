clear; clc
% MATLAB �󲻳���������
% dsolve('Dx1=x1*(0.9-0.1*x2)', 'Dx2=x2*(-0.6+0.02*x1)', 'x1(0)=25, x2(0)=2', 't')

% ������ ode45 ��������ֵ��
% �Ա��� t �ķ�ΧΪ 0-15 �꣬ʳ���Ͳ�ʳ�ߣ����㣩��ʼֵ�ֱ�Ϊ 25 �� 2
% ע�⣺սǰ��ս����ս����ʼǰ��ս����ʼ��ļ�дŶ
[t1, x1] = ode45('pre_war', [0, 15], [25, 2]); % սǰ��΢�ַ���
[t2, x2] = ode45('past_war', [0, 15], [25, 2]); % ս���΢�ַ���
% [t1, x1] = ode45('pre_war', [0:15], [25, 2]); % սǰ��΢�ַ���
% [t2, x2] = ode45('past_war', [0:15], [25, 2]); % ս���΢�ַ���

pre_prey = x1(:, 1);
pre_shark = x1(:, 2); % սǰ��ʳ�������������
past_prey = x2(:, 1);
past_shark = x2(:, 2); % ս���ʳ�������������

figure(1)
plot(pre_prey, pre_shark, '--r', past_prey, past_shark, '-b')
legend('սǰ', 'ս��')
title('�����ʳ�������仯�������ͼ')
xlabel('ʳ������'); ylabel('��������')

figure(2)
plot(t1, pre_prey, '--r', t1, pre_shark, '-r', t2, past_prey, '--b', t2, past_shark, '-b')
legend('սǰʳ������', 'սǰ��������', 'ս��ʳ������', 'ս����������')
xlabel('ʱ��'); ylabel('����')

% ������� = �������� /��������+ʳ������
pre_rate = pre_shark ./ (pre_prey + pre_shark); % սǰ���������
past_rate = past_shark ./ (past_prey + past_shark); % ս����������
figure(3)
plot(t1, pre_rate, '--r', t2, past_rate, '-b')
legend('սǰ���������', 'ս����������')


% % ע�⣺�����ļ������ο���һ����Ҫֱ�������Լ�����ģ����
% % �����������ĵĲ���Ҫ��ǳ��ϸ񣬴�����ͬҲ������Ϯ