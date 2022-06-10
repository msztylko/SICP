;;recursive process
(define (fib1 n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib1 (- n 1))
                   (fib1 (- n 2))))))

(display "Fib1: ")
(display (fib1 10))
(display "\n")

;; iterative process
(define (fib2 n)
    (define (fib-iter a b count)
        (if (= count 0)
            b
            (fib-iter (+ a b) a (- count 1))))
    
    (fib-iter 1 0 n))

(display "Fib2: ")
(display (fib2 10))
