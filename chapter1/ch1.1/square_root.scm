;; Compute square root of a number X using
;; Newton-Raphson method
(define (average a b)
    (/ (+ a b) 2))

; better implementation
(define (good-enough? guess x)
    (= (improve guess x) guess))

;(define (good-enough? guess x)
;    (< (abs (- (square guess) x)) 0.001))

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
(display "\n")
(define b (sqrt 1000000000000))
(display b)
(display "\n")
(define c (sqrt 0.00000000000000000009))
(display c)
(display "\n")
