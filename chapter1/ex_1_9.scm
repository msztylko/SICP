(define (inc x)
    (+ x 1))

(define (dec x)
    (- x 1))

(define (add1 a b)
    (if (= a 0)
        b
        (inc (+ (dec a) b))))

(define (add2 a b)
    (if (= a 0)
        b
        (+ (dec a) (inc b))))

(display (add1 4 5))
(display "\n")
(display (add2 4 5))
