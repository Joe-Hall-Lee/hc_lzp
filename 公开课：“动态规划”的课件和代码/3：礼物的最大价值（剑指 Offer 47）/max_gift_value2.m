%% ��ô������ߵ�·�ߣ�
function [f, path] = max_gift_value2(M)
% ����� M ����������ÿ������ļ�ֵ
[m, n] = size(M); % ���� m �� n ��
FF = M; % ��ʼ�� DP ����� M ��ȫ��ͬ���������� f(i, j)
% ���� FF �ĵ�һ��
FF(:, 1) = cumsum(M(:, 1)); % cumsum �������������ۼӺ�
% ���� FF �ĵ�һ��
FF(1, :) = cumsum(M(1, :));
% ѭ���������²��ֵ�Ԫ��
for i = 2:m
    for j = 2:n
        tem1 = FF(i, j-1) + M(i, j); % �������
        tem2 = FF(i-1, j) + M(i, j); % ��������
        FF(i, j) = max(tem1, tem2);
    end
end
f = FF(m, n);
% ���ݳ����еõ��� DP ���飨FF�����Ƴ���Ӧ��·�� path
path = zeros(m, n); % path ȫΪ 0 �� 1 ��ɣ�1 ��ʾ�����ø���
i = m;
j = n;
while i ~= 1 || j ~= 1 % ֻҪû�лص�ԭ��
    path(i, j) = 1; % �� path ����ĵ� i �е� j �б�� 1����ʾ������������ӣ�
    if i == 1 % ������˵�һ��
        path(1, 1:j) = 1; % ʣ���·���������һֱ�߾Ϳ�����
        break % �˳�ѭ��
    end
    if j == 1 % ������˵�һ��
        path(1:i, 1) = 1; % ʣ���·�������Ϸ�һֱ�߾Ϳ�����
        break % �˳�ѭ��
    end
    tmp1 = FF(i-1, j); % �Ϸ���Ԫ�� FF ��ֵ
    tmp2 = FF(i, j-1); % ��ߵ�Ԫ�� FF ��ֵ
    ind = find([tmp1, tmp2] == (FF(i, j) - M(i, j)), 1); % ���ĸ�ֵ���� FF(i, j) - M(i, j)
    if ind == 1 % ����Ϸ���Ԫ�� FF ��ֵ���� FF(i, j) - M(i, j)
        i = i - 1; % ˵����һ�������Ϸ�����
    else % �����ߵ�Ԫ�� FF ��ֵ���� FF(i, j) - M(i, j)
        j = j - 1; % ˵����һ�������������
    end
end
end
