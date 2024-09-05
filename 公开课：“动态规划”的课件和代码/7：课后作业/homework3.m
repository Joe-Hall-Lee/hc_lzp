% ��ҵ 3�������������ϰ��ĸ���
% ��Ŀ��Դ������ 63. ��ͬ·�� II
% ���ӣ�https://leetcode-cn.com/problems/unique-paths-ii/
function f = homework3(obstacle)
% obstacle ���ϰ������ȫΪ 0 �� 1 ��ɣ�1 ��ʾ���ϰ���
[m, n] = size(obstacle);
FF = ones(m, n); % ��ʼ�� DP ����
% �����һ��
for i = 1:m
    if obstacle(i, 1) == 1 % �������ϰ���
        FF(i:end, 1) = 0; % �ϰ���������λ���Լ��·���λ�ö�Ӧ�� f(i, j) = 0
        break
    end
end
% �����һ��
for j = 1:n
    if obstacle(1, j) == 1
        FF(1, j:end) = 0; % �ϰ���������λ���Լ��ұߵ�λ�ö�Ӧ�� f(i, j) = 0
        break
    end
end
% ѭ���������²��ֵ�Ԫ��
for i = 2:m
    for j = 2:n
        if obstacle(i, j) == 1
            FF(i, j) = 0;
        else
            FF(i, j) = FF(i, j-1) + FF(i-1, j);
        end
    end
end
f = FF(m, n);
end
