% ��ҵ 1����¥��
% ��Ŀ��Դ������ 70. ��¥��
% ���ӣ�https://leetcode-cn.com/problems/climbing-stairs
function F = homework1(n)
if n == 1
    F = 1;
elseif n == 2
    F = 2;
else
    FF = ones(1, n); % ��ʼ�� DP ����
    FF(2) = 2;
    for i = 3:n
        FF(i) = FF(i-1) + FF(i-2);
    end
    F = FF(n);
end
end