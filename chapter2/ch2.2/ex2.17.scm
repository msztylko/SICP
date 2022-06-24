(define (last-pair list1)
    (if (= 1 (length (cdr list1)))
        (cdr list1)
        (last-pair (cdr list1))))

(define (length list1)
    (if (null? list1)
        0
        (+ 1 (length (cdr  list1)))))

(display "(last-pair (list 23 72 149 34)): ")
(display (last-pair (list 23 72 149 34)))
