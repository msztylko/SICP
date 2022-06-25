(define a (list 1 3 (list 5 7) 9 ))
(define b (list (list 7)))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(display a)
(newline)
(display (car (cdaddr a)))
(newline)

(display b)
(newline)
(display (caar b))
(newline)

(display c)
(newline)
(display (cadadr (cadadr (cadadr c))))
