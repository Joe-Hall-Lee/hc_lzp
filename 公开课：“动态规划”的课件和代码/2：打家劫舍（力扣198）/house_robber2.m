%% ͨ��״̬ѹ������ʡ�ռ�����
function f = house_robber2(M)
% ����� M ����ÿ�䷿������Ľ��
n = length(M); % һ�����ټ䷿��
if n == 1 % ֻ�е� 1 �䷿�ӿ���͵ʱ��f Ӧ�õ�����䷿�ӵĽ��
    f = M(1);
elseif n == 2 % ֻ��ǰ���䷿�ӿ���͵ʱ��f Ӧ�õ��ڽϴ�Ľ��
    f = max(M(1), M(2));
else
    pre2 = M(1); % ����F(i-2)��ֵ
    pre1 = max(M(1), M(2)); % ����F(i-1)��ֵ
    for i = 3:n
        cur = max(pre1, pre2+M(i)); % �� FF(i) = max(FF(i-1), FF(i-2)+M(i));
        pre2 = pre1; % F(i-2) ��ǰ�� 1 λ��� F(i-1)
        pre1 = cur; % F(i-1) ��ǰ�� 1 λ��� F(i)
    end
    f = cur; % ��� FF(i)����ʱ i = n��Ҳ����ԭ����Ľ�
end
end
