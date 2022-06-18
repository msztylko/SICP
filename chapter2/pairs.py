# pairs as data

def cons_d(x, y):
    return (x, y)

def car_d(pair):
    return pair[0]

def cdr_d(pair):
    return pair[1]

# pairs as procedures

def cons_p(x, y):
    def dispatch(m):
        if m == 0:
            return x
        elif m == 1:
            return y
        else:
            raise ValueError()
    return dispatch

def car_p(pair):
    return pair(0)

def cdr_p(pair):
    return pair(1)


def test():
    a = cons_d(4, 5)
    c = cons_p(4, 5)

    assert car_d(a) == 4
    assert cdr_d(a) == 5

    assert car_p(c) == 4
    assert cdr_p(c) == 5

    b = cons_d(3, cons_d(5, cons_d(8, 4)))
    d = cons_p(3, cons_p(5, cons_p(8, 4)))

    assert car_d(b) == 3
    assert car_d(cdr_d(b)) == 5
    assert car_d(cdr_d(cdr_d(b))) == 8
    assert cdr_d(cdr_d(cdr_d(b))) == 4

    assert car_p(d) == 3
    assert car_p(cdr_p(d)) == 5
    assert car_p(cdr_p(cdr_p(d))) == 8
    assert cdr_p(cdr_p(cdr_p(d))) == 4


if __name__ == '__main__':
    test()
