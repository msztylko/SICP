(define (square x)
    (* x x))

(define (sum-squares a b)
    (+ (square a) (square b)))

(define (sum-squares-2-largest x y z)
    ;; find smallest number
    (cond
    ;; x smallest
         ((and (< x y) (< x z)) (sum-squares y z))
    ;; y smallest
         ((and (< y x) (< y z)) (sum-squares x z))
    ;; z smallest
         ((and (< z x) (< z y)) (sum-squares x y))
    ))

(display (sum-squares-2-largest 1 2 3))
(display "\n")
(display (sum-squares-2-largest 5 9 13))
