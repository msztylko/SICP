(define (make-accumulator initial)
    (let ((sum initial))
        (lambda (amount)
            (begin (set! sum (+ sum amount))
                   (display sum)
                   sum))))

;; test
(define A (make-accumulator 5))

(display "(A 10), expected 15, got: ")
(A 10)
(newline)
(display "(A 10), expected 25, got: ")
(A 10)
(newline)
