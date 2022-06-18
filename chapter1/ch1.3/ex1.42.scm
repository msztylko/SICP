(define (square x) (* x x)) 

(define (inc x) (+ x 1))

(define (compose f g)
  (lambda (x) (f (g x))))

(display "((compose square inc) 6) -> ")
(display ((compose square inc) 6))
