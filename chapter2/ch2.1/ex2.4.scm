(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define a (cons 3 6))

(display "define a (cons 3 6)")
(display "\n(car a) -> ")
(display (car a))
(display "\n(cdr a) -> ")
(display (cdr a))
