(define (count-leaves x)
  (cond ((null? x) 0)  
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define x (cons (list 1 2) (list 3 4)))

(display "(count-leaves x)\n")
(display (count-leaves x))
(newline)

(display "(list x x)\n")
(display (list x x))
(newline)

(display "(count-leaves (list x x))\n")
(display (count-leaves (list x x)))
