(define (equal? list1 list2)
   (cond
        ;; if not a list then simply check eq?
        ((and (not (pair? list1)) (not (pair? list2)))
         (eq? list1 list2))
        ;; if lists check recursively
        ((and (pair? list1) (pair? list2))
         (and (equal? (car list1) (car list2))
              (equal? (cdr list1) (cdr list2))))
        (else #f)))


(display (equal? '(this is a list) '(this is a list)))
;; true
(display (equal? '(this is a list) '(this (is a) list)))
;; false
