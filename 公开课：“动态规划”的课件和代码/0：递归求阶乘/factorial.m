function F = factorial(n)
% ���õݹ��������� n �Ľ׳�
if n == 1 % �ݹ�ĳ���
    F = 1;
else
    F = n * factorial(n-1);
end
end
