function F = fib_dg(n)
% ���õݹ����쳲���������
if n == 0 % �ݹ�ĵ�һ������
    F = 0;
elseif n == 1 % �ݹ�ĵڶ�������
    F = 1;
else
    F = fib_dg(n-1) + fib_dg(n-2);
end
end
