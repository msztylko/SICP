(define (memq item x)
  (cond ((null? x) #f)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(display (list 'a 'b 'c))
(newline)
(display (list (list 'george)))
(newline)
(display (cdr '((x1 x2) (y1 y2))))
(newline)
(display (cadr '((x1 x2) (y1 y2))))
(newline)
(display (pair? (car '(a short list))))
(newline)
(display (memq 'red '((red shoes) (blue socks))))
(newline)
(display (memq 'red '(red shoes blue socks)))

