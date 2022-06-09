(define (factorial1 n)
    (if (= n 0)
        1
        (* n (factorial1 (- n 1)))))

(define (factorial2 n)
    (define (factorial product counter max-count)
        (if (> counter max-count)
            product
            (factorial (* product counter)
                       (+ counter 1)
                       max-count)))
    (factorial 1 1 n))

(define a (factorial1 20))
(display a)
(display "\n")
(define b (factorial2 20))
(display b)
(display "\n")
