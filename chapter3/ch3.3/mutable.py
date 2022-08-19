def cons(x, y):
    def set_x(v):
        nonlocal x
        x = v

    def set_y(v):
        nonlocal y
        y = v

    def dispatch(m):
        if m == "car":
            return x
        elif m == "cdr":
            return y
        elif m == "set_car":
            return set_x
        elif m == "set_cdr":
            return set_y
        else:
            raise ValueError(f"Incorrect message {m}")

    return dispatch


def car(pair):
    return pair("car")


def cdr(pair):
    return pair("cdr")


def set_car(pair, v):
    return pair("set_car")(v)


def set_cdr(pair, v):
    return pair("set_cdr")(v)


# Tests
a = cons(3, 6)
print(f"{car(a) = }")
print(f"{cdr(a) = }")
set_car(a, 2)
set_cdr(a, 9)
print(f"{car(a) = }")
print(f"{cdr(a) = }")
