;; recursive process

(define (expt1 b n)
    (if (= n 0)
        1
        (* b (expt1 b (- n 1)))))

(display "expt1: ")
(display (expt1 2 10))
(display "\n")
;; iterative process

(define (expt2 b n)
    (expt-iter b n 1))

(define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b
                   (- counter 1)
                   (* b product))))

(display "expt2: ")
(display (expt2 2 10))
(display "\n")
;; fast exponentiation

(define (expt3 b n)
    (cond ((= n 0) 1)
          ((even? n) (square (expt3 b (/ n 2))))
          (else (* b (expt3 b (- n 1))))))

(define (even? n)
    (= (remainder n 2) 0))

(display "expt3: ")
(display (expt3 2 10))
(display "\n")
