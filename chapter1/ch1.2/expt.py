# recursive process

def expt1(b, n):
    if n == 0:
        return 1
    else:
        return b * expt1(b, n - 1)

print(f'{expt1(2, 100) = }')

# iterative process

def expt2(b, n):
    def expt_iter(b, counter, product):
        if counter == 0:
            return product
        else:
            return expt_iter(b, counter-1, product*b)

    return expt_iter(b, n , 1)

print(f'{expt2(2, 100) = }')

# fast exponentiation

def expt3(b, n):
    if n == 0:
        return 1
    elif n % 2 == 0:
        return expt3(b, n // 2) ** 2
    else:
        return b * expt3(b, n - 1)

print(f'{expt3(2, 100) = }')
