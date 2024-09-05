%% 01 �������⣨01 Knapsack problem��
function f = knapsack01problem1(p, w, W)
% ���룺p: ��Ʒ������w: ��Ʒ��������W: ����������
% Ϊ�˱�̷��㣬���� W �Ǵ��ڵ��� 2 ����������w ��ÿ��Ԫ�ض��Ǵ��ڵ��� 1 ��������
m = length(p); % ��Ʒ����
FF = zeros(m, W); % ��ʼ�� DP ����
% FF(i,j): ǰ i ����Ʒѡ���Եķ�������Ϊ j �ı��������ܻ�õ��������
if w(1) <= W % ��ʼ����һ��
    FF(1, w(1):end) = p(1);
end
for i = 2:m % ��ʼ����һ��
    FF(i, 1) = max([p(w(1:i) == 1), 0]);
end
% i, j > 1 �����
for i = 2:m
    for j = 2:W
        if w(i) > j % �� i ����Ʒ������ w(i) �ȱ��������� j ��Ҫ��
            FF(i, j) = FF(i-1, j);
        elseif w(i) == j % �� i ����Ʒ������ w(i) ���ڱ��������� j
            FF(i, j) = max(FF(i-1, j), p(i)); % ���Ž�ȥ�ͷŽ�ȥȡ�ϴ��ֵ
        else % �� i ����Ʒ������ w(i) С�ڱ��������� j
            FF(i, j) = max(FF(i-1, j), p(i)+FF(i-1, j-w(i))); % ���Ž�ȥ�ͷŽ�ȥȡ�ϴ��ֵ
        end
    end
end
f = FF(m, W);
end
