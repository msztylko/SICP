(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(define (cc amount kinds-of-coins)
    (cond
        ;; amount is 0, 1 way to make change
        ((= amount 0) 1)
        ;; amount is < 0 or kinds of coins are 0, 0 ways to make change
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        ;; typical case
        (else (+
                ;; number of ways to change amount using all but the first kind of coin
                (cc amount (- kinds-of-coins 1))
                ;; number of ways to change amount a - d using all n kinds of coins
                ;; where d is the denomination of the first kind of coin.
                (cc (- amount
                       (first-denomination kinds-of-coins))
                    kinds-of-coins)))))

(define (count-change amount)
    (cc amount 5))

(display "Count change 1 dollar - 100 cents\n")
(display (count-change 100))
