%% ��Ŀ��Դ����Ǯ�һ������� 322��
function f = coin_change1(coins, S)
% coins: ��ͬ��ֵ��Ӳ�ң�S: �ܽ��
% f(x) = min{f(x-c_i) for every c_i in coins} + 1
% x < 0 ʱ, f(x) = +inf; x = 0 ʱ, f(x) = 0
FF = +inf * ones(1, S+2); % ��ʼ�� DP ����ȫΪ������
% ע�⣬��� DP ���鳤��Ϊ S + 2��ǰ�� S �������������õ�
% FF(x) Ϊ�ճ�Ŀ���� x(x �� S) ��������ٵ�Ӳ�Ҹ���
% Ϊʲô���ﻹҪ�ں����ټ�������Ԫ���أ�
% �����Ҿ�֪�������������
FF(S+2) = 0; % ���һ��Ԫ�ظ�Ϊ 0
for x = 1:S % ע�⣬FF ֻ��Ҫ����ǰ S ��Ԫ��
    tmp = x - coins; % ����� 'x-c_i' for every c_i in coins
    tmp(tmp < 0) = S + 1; % FF �±�Ϊ S + 1 ��Ԫ��Ϊ +inf���������ǰ� tmp < 0 ��λ�ñ�� S + 1
    tmp(tmp == 0) = S + 2; % FF �±�Ϊ S + 2 ��Ԫ��Ϊ 0���������ǰ� tmp = 0 ��λ�ñ�� S + 2
    FF(x) = min(FF(tmp)) + 1; % f(x) = min{f(x-c_i) for every c_i in coins} + 1
end
if FF(S) < +inf
    f = FF(S);
else
    f = -1; % ���û���κ�һ��Ӳ�����������ܽ�� S �ͷ��� -1
end
end
