(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1)
              (append (cdr list1) list2))))

(define x (list 1 2 3))
(define y (list 4 5 6))

(display "(append x y)\n")
(display (append x y))
(newline)

(display "(cons x y)\n")
(display (cons x y))
(newline)

(display "(list x y)\n")
(display (list x y))

