;; recursive process

(define (f1 n)
    (if (< n 3)
        n
        (+ (f1 (- n 1))
           (* 2 (f1 (- n 2)))
           (* 3 (f1 (- n 3))))))

(display "f1\n")
(display (f1 7))

;; iterative process

(define (f-iter a b c count)
    (if (= count 0)
        a
        (f-iter b
                c
                (+ c (* 2 b) (* 3 a))
                (- count 1))))

(define (f2 n)
    (f-iter 0 1 2 n))

(display "\nf2\n")
(display (f2 7))


