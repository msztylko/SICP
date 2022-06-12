# Recursive

def fib1(n):
    if n < 2:
        return n
    else:
        return fib1(n - 1) + fib1(n - 2)

print(f'{fib1(10) = }')

# Iterative

def fib2(n):
    def fib(a, b, count):
        if count == 0:
            return b
        else:
            return fib(a+b, a, count-1)
    return fib(1, 0, n)

print(f'{fib2(10) = }')
