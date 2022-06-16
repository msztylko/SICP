(define (identity x) x)

(define (inc x) (+ x 1))

;; recursive product
(define (product1 term a next b)
  (if (> a b)
      1
      (* (term a)
         (product1 term (next a) next b))))


(define (factorial1 n)
  (product1 identity 1 inc n))

(display "\nfactorial1(10): ")
(display (factorial1 10))


;; iterative product

(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial2 n)
  (product2 identity 1 inc n))

(display "\nfactorial2(10): ")
(display (factorial2 10))
