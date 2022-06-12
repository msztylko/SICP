(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

(display "gcd(206 40): ")
(display (gcd 206 40))
(display "\n")
