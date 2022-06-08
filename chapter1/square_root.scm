;; Compute square root of a number X using
;; Newton-Raphson method
(define (average a b)
    (/ (+ a b) 2))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
    (average guess (/ x guess)))

(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (sqrt x)
    ;; start with 1 as a first approximation
    (sqrt-iter 1.0 x))

(define a (sqrt 2))
(display a)
