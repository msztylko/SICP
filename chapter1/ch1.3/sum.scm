(define (cube x) (* x x x))

(define (inc x) (+ x 1))


;; recursive sum
(define (sum1 term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum1 term (next a) next b))))

(define (sum-cubes1 a b)
    (sum1 cube a inc b))

(display "\nsum-cubes1: ")
(display (sum-cubes1 1 10))

;; iterative
(define (sum2 term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (+ (term a) result))))
    (iter a 0))

(define (sum-cubes2 a b)
    (sum2 cube a inc b))

(display "\nsum-cubes2: ")
(display (sum-cubes2 1 10))


