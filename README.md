# SICP
notes from reading Structure and Interpretation of Computer Programs

<p align="center">
<img src="https://github.com/msztylko/SICP/blob/master/docs/wizard.jpeg" data-canonical- width="400" height="300" align="center" />
</p>

Other useful materials helpful in exploration of [elegant weapons](https://xkcd.com/297/):
 - [Brian Harvey’s SICP lectures](https://archive.org/details/ucberkeley-webcast-PL3E89002AA9B9879E?sort=titleSorter)
 - [Programming Languages Virtual Meetup SICP](https://www.youtube.com/watch?v=oA-FdE3KV88&list=PLVFrD1dmDdvdvWFK8brOVNL7bKHpE-9w0)
 - [Lambda? You Keep Using that Letter - Kevlin Henney](https://www.youtube.com/watch?v=Y7StjYhXvpE)

## Scheme Installation
To run Scheme interpreter on Mac M1 with ARM silicon the best tool I've found is [Gambit Scheme](https://gambitscheme.org/) as it's readily available on Homebrew. To install it, simply run `brew install gambit-scheme`

### Jupyter
For using Scheme in Jupyter Notebook I've used [Calysto Scheme](https://github.com/Calysto/calysto_scheme)

# Notes

## [Procedures and the Processes They Generate](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-11.html#footnote_Temp_48:~:text=Procedures%20and%20the%20Processes%20They%20Generate)

Great explanation of recursive procedures vs recursive processes, illustrated with factorial function. 

### Recursive procedure, recursive process

```python
def factorial1(n):
    if n == 0:
        return 1
    else:
        return n * factorial1(n-1)
```

* recursive procedure - factorial1 calls itself in the definition
* recursive process - chain of deferred operations, interpreter keeps track of operations to be performed later

### Recursive procedure, iterative process

```python
def factorial2(n):
    def factorial(product, counter, max_count):
        if counter > max_count:
            return product
        else:
            return factorial(product * counter, counter + 1, max_count)
            
    return factorial(1, 1, n)    
```

* recursive procedure - factorial calls itself in the definition
* iterative process - state can be summarized by state variables (product, counter, max_count) that we pass from one state to the next

### Iterative procedure, iterative process

```python
def factorial3(n):
    product = 1
    counter = 1
    max_count = n
    
    while counter <= max_count:
        product *= counter
        counter += 1
    
    return product
```

* iterative process - no self-reference in the function definition, use of "looping construct" (while)
* iterative process - state summarized by fixed number of state variables

More exploration in [processes.ipynb](./chapter1/ch1.2/processes.ipynb) and similar functions in [Scheme](./chapter1/ch1.2/processes.scm)

### Fibonacci numbers example

Recursive process

```scheme
(define (fib1 n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib1 (- n 1))
                   (fib1 (- n 2))))))
```

Iterative process

```scheme
(define (fib2 n)
    (define (fib-iter a b count)
        (if (= count 0)
            b
            (fib-iter (+ a b) a (- count 1))))
    
    (fib-iter 1 0 n))
```

Files with the same example [fibonacci.scm](./chapter1/ch1.2/fibonacci.scm) and [fibonacci.py](./chapter1/ch1.2/fibonacci.py)

## [Formulating Abstractions with Higher-Order Procedures](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-12.html#%_sec_1.3)

Many similar procedures like:

```scheme
(define (sum-integers a b)
    (if (> a b)
    0
    (+ a (sum-integers (+ a 1) b))))
    
(define (sum-cubes a b)
    (if (> a b)
    0
    (+ (cube a) (sum-cubes (+ a 1) b))))
```

can be defined in terms of the pattern they share:

```scheme
(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a)
           (sum term (next a) next b))))      
```

Procedure for summing cubes can now be rewritten as:

```scheme
(define (sum-cubes a b)
    (sum cube a inc b))
    
(define (inc n) (+ n 1))
```

However, `sum` procedure is only one example of this class of functions. Another example:

```scheme
(define (product term a next b)
    (if (> a b)
        1
        (* (term a)
           (product term (next a) next b))))
```

Here, we can again see many similarities between these procedures. In the same way as `sum-integers` and `sum-cubes` are just special cases of a more general procedure `sum`, `sum` and `product` can be viewed as special cases of a more general procedure `accumulate`:

```scheme
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
```
See [ex1.32](./chapter1/ch1.3/ex1.32.scm) for comaprison of recursive and iterative `accumulate`

Defining procedure as a special cases of some more abstract (higher-order) procedure is possible thanks to **first-class functions**.

Once we have higher-order function that operate on other procedures we frequently need to define smaller, helper procedures like:
```scheme
(define (inc n) (+ n 1))
```
It's not very convenient to create a new procedure for simplest operations like increment and that's why **anonymous procedures** become useful:
```scheme
(lambda (n) (+ n 1))
```

## [What Is Meant by Data?](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-14.html#%_sec_2.1.3)

Data can be defined in terms of its behaviour specified by constructor (`make-rational`) and selectors (`nominator`, `denominator`):

```scheme
(define x (make-rational n d))

(= (/ (numer x) (denom x)) (/ n d))
```

in a simlar way we can define `cons`, `car` and `cdr` by its behaviour:

```scheme
(define z (cons x y))
(= (car z) x)
(= (cdr z) y)
```

We can implement such behaviour without any data structures, only using prodecures:

```scheme
(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1 -- CONS" m))))
  dispatch)

(define (car z) (z 0))

(define (cdr z) (z 1))
```

**Data** can be implemented in terms of **procedures**. 

Similar example in Python:

```python
# pairs as data

def cons_d(x, y):
    return (x, y)

def car_d(pair):
    return pair[0]

def cdr_d(pair):
    return pair[1]
```

```python
# pairs as procedures

def cons_p(x, y):
    def dispatch(m):
        if m == 0:
            return x
        elif m == 1:
            return y
        else:
            raise ValueError()

    return dispatch

def car_p(pair):
    return pair(0)

def cdr_p(pair):
    return pair(1)
```

Examples of usage: [pairs.py](./chapter2/ch2.1/pairs.py)

## [Sequence Operations](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-15.html#%_sec_2.2.3)

Sequence processing can be defined in many ways:

```scheme
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)  
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))
```
```scheme
(define (even-fibs n)
  (define (next k)
    (if (> k n)
        `()
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))
```

In these implementations `sum-odd-squares` and `even-fibs` are structurally different, but in fact they consist of similar operations:
 - enumerate initial data
 - filter them
 - transform with some function
 - accumulate the result

We can define these underlying operations and think about program as a flow of "signals" from one stage to the next.

* Enumerate interval/tree
```scheme
(define (enumerate-interval low high)
    (if (> low high)
        `()
        (cons low (enumerate-interval (+ low 1) high))))
        
(define (enumerate-tree tree)
    (cond ((null? tree) `())
          ((not (pair? tree)) (list tree))
          (else (append (enumerate-tree (car tree))
                        (enumerate-tree (cdr tree))))))
```

* Filter
```scheme
(define (filter predicate sequence)
    (cond ((null? sequence) `())
          ((predicate (car sequence))
           (cons (car sequence)
                 (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))
```
* Transform - `map`

* Accumulate
```scheme
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence)))))
```

With these operations defined `sum-odd-squares` and `even-fibs` can be reformulated as a signal flow.

```scheme
(define (sum-odd-squares tree)
    (accumulate +
                0
                (map square
                    (filter odd?
                        (enumerate-tree tree)))))

(define (even-fibs n)
    (accumulate cons
                `()
                (filter even?
                    (map fib
                        (enumerate-interval 0 n)))))
```

## Eval/Apply - first encounter

Not exactly `eval` and `apply` functions from Scheme, but something very similar was used to implement [calculator interpreter](https://github.com/msztylko/calculators#alternative-approach).

## Abstract Data
Separate [README](./chapter2/ch2.4/README.md) for the exploration of this topic. 

## [Message Passing](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-4.html#%_toc_%_sec_3.1.1)

First example of this technique was shown in section [What Is Meant by Data?](https://github.com/msztylko/SICP#what-is-meant-by-data), where `cons` pair was coded as a dispatch procedure. In a similar way, we can create "object" to represent a bank account that is again implemented as a dispatch procedure.

```scheme
(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)
```
