(define (fringe tree)
    (if (null? tree)
        `()
        (let ((first (car tree)))
            (if (not (pair? first))
                (cons first (fringe (cdr tree)))
                (append (fringe first) (fringe (cdr tree)))))))

(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1)
              (append (cdr list1) list2))))

(define x (list (list 1 2) (list 3 4)))

(display x)
(newline)

(display "(fringe x)\n")
(display (fringe x))
(newline)

(display "(fringe (list x x))\n")
(display (fringe (list x x)))
