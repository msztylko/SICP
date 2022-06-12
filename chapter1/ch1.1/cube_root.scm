;; Compute cube root of a number X using
;; Newton-Raphson method
(define (good-enough? guess x)
    (= (improve guess x) guess))

(define (improve guess x)
    (/ (+
          (* 2 guess)
          (/ x (square guess)))
        3))

(define (cube-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-iter (improve guess x) x)))

(define (cube x)
    ;; start with 1 as a first approximation
    (cube-iter 1.0 x))

(define a (cube 27))
(display a)
(display "\n")
(define b (cube 1000000000000))
(display b)
(display "\n")
(define c (cube 0.00000000000000000009))
(display c)
(display "\n")
