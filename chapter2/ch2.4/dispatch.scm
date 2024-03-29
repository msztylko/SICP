;; Implementation

    ;; data tags
(define (attach-tag type-tag contents)
    (cons type-tag contents))

(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "Bad tagged datum -- CONTENTS" datum)))

    ;; Rectangular Representation
(define (rectangular? z)
    (eq? (type-tag z) `rectangular))

(define (real-part-rectangular z)
    (car z))
(define (imag-part-rectangular z)
    (cdr z))
(define (magnitude-rectangular z)
    (sqrt (+ (square (real-part-rectangular z))
             (square (imag-part-rectangular z)))))
(define (angle-rectangular z)
    (atan (imag-part-rectangular z)
          (real-part-rectangular z)))

(define (make-from-real-imag-rectangular x y)
    (attach-tag `rectangular (cons x y)))
(define (make-from-mag-ang-rectangular r a)
    (attach-tag `rectangular
                (cons (* r (cos a)) (* r (sin a)))))

    ;; Polar Representation
(define (polar? z)
    (eq? (type-tag z) `polar))

(define (real-part-polar z)
    (* (magnitude-polar z) (cos (angle-polar z))))
(define (imag-part-polar z)
    (* (magnitude-polar z) (sin (angle-polar z))))
(define (magnitude-polar z)
    (car z))
(define (angle-polar z)
    (cdr z))

(define (make-from-real-imag-polar x y)
    (attach-tag `polar
                (cons (sqrt (+ (square x) (square y)))
                      (atan y x))))
(define (make-from-mag-ang-polar r a)
    (attach-tag `polar (cons r a)))

;; Public API

    ;; constructors
(define (make-from-real-imag x y)
    (make-from-real-imag-rectangular x y))

(define (make-from-mag-ang r a)
    (make-from-mag-ang-polar r a))

    ;; selectors
    ;; dispatch on type allows usage with different representations
(define (real-part z)
    (cond ((rectangular? z)
           (real-part-rectangular (contents z)))
          ((polar? z)
           (real-part-polar (contents z)))
          (else (error "Unknown type -- REAL-PART" z))))

(define (imag-part z)
    (cond ((rectangular? z)
           (imag-part-rectangular (contents z)))
          ((polar? z)
           (imag-part-polar (contents z)))
          (else (error "Unknown type -- IMAG-PART" z))))

(define (magnitude z)
    (cond ((rectangular? z)
           (magnitude-rectangular (contents z)))
          ((polar? z)
           (magnitude-polar (contents z)))
          (else (error "Unknown type -- MAGNITUDE" z))))

(define (angle z)
    (cond ((rectangular? z)
           (angle-rectangular (contents z)))
          ((polar? z)
           (angle-polar (contents z)))
          (else (error "Unknown type -- ANGLE" z))))

    ;; operations
    ;; generic, selectors can work with either represntation
(define (add-complex z1 z2)
    (make-from-real-imag (+ (real-part z1) (real-part z2))
                         (+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
    (make-from-real-imag (- (real-part z1) (real-part z2))
                         (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
    (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                       (+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
    (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                       (- (angle z1) (angle z2))))

;; TEST
(define z1 (make-from-real-imag 3 4))
(define z2 (make-from-real-imag 2 3))

(display "(real-part z1), expecting: 3, got:  ")
(display (real-part z1))
(newline)

(display "(real-part z2), expecting: 2, got:  ")
(display (real-part z2))
(newline)

(display "(imag-part z1), expecting: 4, got:  ")
(display (imag-part z1))
(newline)

(display "(imag-part z2), expecting: 3, got:  ")
(display (imag-part z2))
(newline)

(display "(magnitude z1), expecting: 5, got:  ")
(display (magnitude z1))
(newline)

(display "(magnitude z2), expecting: 3.606, got:  ")
(display (magnitude z2))
(newline)

(display "(angle z1), expecting: 0.927, got:  ")
(display (angle z1))
(newline)

(display "(angle z2), expecting: 0.983, got:  ")
(display (angle z2))
(newline)

(display "(add-complex z1 z2): ")
(display (add-complex z1 z2))
(newline)
(display "(sub-complex z1 z2): ")
(display (sub-complex z1 z2))
(newline)
(display "(mul-complex z1 z2): ")
(display (mul-complex z1 z2))
(newline)
(display "(div-complex z1 z2): ")
(display (div-complex z1 z2))
(newline)
