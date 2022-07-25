;; Sets as ordered lists

(define (element-of-set? x set)
    (cond ((null? set) #f)
          ((= x (car set)) #t)
          ((< x (car set)) #f)
          (else (element-of-set? x (cdr set))))) 

(define (adjoint-set x set)
    (if (element-of-set? x set)
        set
        (if (< x (car set))
            (cons x set)
            (cons (car set) (adjoint-set x (cdr set))))))

(display (adjoint-set 2 `(1 2 3 4)))
(newline)
(display (adjoint-set 2 `(1 3 4)))

;;(define (intersection-set set1 set2)

;;(define (union-set set1 set2)
