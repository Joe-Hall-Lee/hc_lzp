function F = fib_zdxs(n)
% �����Ե����ϵ�˼�����쳲���������
FF = ones(1, n); % ��ʼ�������м��������飨������ȫΪ 1
if n <= 2
    F = 1;
else
    for i = 3:n
        FF(i) = FF(i-1) + FF(i-2);
    end
    F = FF(n);
end
end
