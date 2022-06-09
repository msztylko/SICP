# SICP
notes from reading Structure and Interpretation of Computer Programs

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

More exploration in [processes.ipynb](./chapter1/processes.ipynb) and similar functions in [Scheme](./chapter1/processes.scm)
