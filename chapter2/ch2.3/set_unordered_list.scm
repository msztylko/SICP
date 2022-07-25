;; Sets implemented as unordered lists
(include "ex2.54.scm")

(define (element-of-set? x set)
    (cond ((null? set) #f)
          ((equal? x (car set)) #t)
          (else (element-of-set? x (cdr set)))))

(define (adjoint-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)))

(define (intersection-set set1 set2)
    (cond ((or (null? set1) (null? set2)) `())
          ((element-of-set? (car set1) set2)
           (cons (car set1) (intersection (cdr set1) set2)))
          (else (intersection (cdr set1) set2))))

(define (union-set set1 set2)
    (cond ((null? set1) set2)
          ((element-of-set? (car set1) set2)
           (union-set (cdr set1) set2))
          (else (cons (car set1) (union-set (cdr set1) set2)))))

(display (union-set `(1 2 3) `(4 5 6)))
;; 1 2 3 4 5 6
(newline)
(display (union-set `(1 2 3) `(2 3 4)))
;; 1 2 3 4    
