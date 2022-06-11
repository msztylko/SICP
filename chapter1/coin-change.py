def first_denomination(kinds_of_coins):
    mapping = {
                1: 1,
                2: 5,
                3: 10,
                4: 25,
                5: 50,
              }
    return mapping[kinds_of_coins]

def cc(amount, kinds_of_coins):
    if amount == 0:
        return 1
    elif amount < 0 or kinds_of_coins == 0:
        return 0
    else:
        return (cc(amount, kinds_of_coins - 1) + 
               cc(amount - first_denomination(kinds_of_coins), kinds_of_coins))

def coin_change(amount):
    return cc(amount, 5)

print(f'{coin_change(100) = }')
