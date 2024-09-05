% ��Ŀ��Դ����ָ Offer 47: ���������ֵ
function f = max_gift_value1(M)
% �����M����������ÿ������ļ�ֵ
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
end