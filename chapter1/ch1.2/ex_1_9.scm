(define (inc x)
    (+ x 1))

(define (dec x)
    (- x 1))

;; recursive prodecure - calls itself
;; recursive process - call to itself in a nested scope
;; doesn't get evaluate but rather creates deferred chain of operations
(define (add1 a b)
    (if (= a 0)
        b
        (inc (add1 (dec a) b))))

(display (add1 4 5))
(display "\n")

;; recursive prodecure - calls itself
;; iterative process - calls itself at the top level so arguments
;; are first evaluated 
(define (add2 a b)
    (if (= a 0)
        b
        (add2 (dec a) (inc b))))

(display (add2 4 5))
