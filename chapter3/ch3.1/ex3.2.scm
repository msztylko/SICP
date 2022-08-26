(define (make-monitored fn)
    (let ((counter 0))
        (define (how-many-calls?)
            counter)
        (define (reset-counter)
            (set! counter 0))
        (define (dispatch m)
            (cond ((eq? m 'how-many-calls?) how-many-calls?)
                  ((eq? m 'reset-counter) reset-counter)
                  (else (begin (set! counter (+ counter 1))
                               (display (fn m))
                               (fn m)))))
    dispatch))

;; test
(define s (make-monitored sqrt))

(display "(s 225), expected 15, got: ")
(s 225)
(newline)
(display "(s 100), expected 10, got: ")
(s 100)
(newline)
(display "(s 'how-many-calls?), expected 2, got: ")
(s 'how-many-calls?)
(newline)
(display "(s 'reset-counter)")
(s 'reset-counter)
(newline)
(display "(s 'how-many-calls?), expected 0, got: ")
(s 'how-many-calls?)
(newline)

