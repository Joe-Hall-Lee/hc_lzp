% ��ҵ 4�������ӵ���Ŀ��͵ķ�����
% ��Ŀ��Դ������ 1155. �����ӵ���Ŀ��͵ķ�����
% ���ӣ�https://leetcode-cn.com/problems/number-of-dice-rolls-with-target-sum
function f = homework4(m, f, S)
% m �����ӣ�ÿ������ f ���棬��Ҫ�����ܵ���Ϊ S
FF = zeros(m, S); % ��ʼ�� DP ����
% �����һ��
FF(1, 1) = 1; % ��һ��Ԫ��Ϊ 1������λ��Ԫ��Ϊ 0��
% �����һ��
for j = 1:S
    if j <= f
        FF(1, j) = 1; % ǰ f ��Ԫ�أ�����еĻ���Ϊ 1������λ��Ԫ��Ϊ 0��
    end
end
% ѭ���������²��ֵ�Ԫ��
for i = 2:m
    for j = 2:S
        for k = 1:f
            if j > k
                FF(i, j) = FF(i, j) + FF(i-1, j-k);
            else
                break
            end
        end
    end
end
f = FF(m, S);
end