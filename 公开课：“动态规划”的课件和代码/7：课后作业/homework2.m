% ��ҵ 2���������߸���
% ��Ŀ��Դ������ 62. ��ͬ·��
% ���ӣ�https://leetcode-cn.com/problems/unique-paths/
function f = homework2(m, n)
% ������ m �� n ��
FF = ones(m, n); % ��ʼ�� DP ����ȫΪ 1
% ѭ���������²��ֵ�Ԫ��
for i = 2:m
    for j = 2:n
        tem1 = FF(i, j-1); % ������
        tem2 = FF(i-1, j); % �������
        FF(i, j) = tem1 + tem2;
    end
end
f = FF(m, n);
end
