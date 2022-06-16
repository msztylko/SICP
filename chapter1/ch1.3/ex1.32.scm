;; iterative

(define (accumulate combiner null-value term a next b)
    (define (iter a result)
      (if (> a b)
          result
          (iter (next a) (combiner (term a) result))))
  (iter a null-value))

;; recursive

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

;; sum from accumulate
(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (cube x) (* x x x))

(define (inc x) (+ x 1))

(display "\nsum-cubes(1,10): ")
(display (sum-cubes 1 10))

;; product from accumulate
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product identity 1 inc n))

(define (identity x) x)

(display "\nfactorial(10): ")
(display (factorial 10))
