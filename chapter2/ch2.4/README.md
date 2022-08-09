# [Multiple Representations for Abstract Data](https://mitpress.mit.edu/sites/default/files/sicp/full-text/book/book-Z-H-17.html#%_sec_2.4)

This section starts by talking about **data abstraction** as a technique for managing code complexity. Basic idea is to introduce a layer of separation between "higher-level" operations and "lower-level" representations. 

<p align="center">
<img width="473" alt="image" src="https://user-images.githubusercontent.com/39266310/183259461-102436a1-8519-4b87-a06e-566b6456b4e7.png">
</p>

## Dispatch on type

Once we establish data abstraction by using generic operations implemented in terms of abstract selectors we still have to deal with the problem of multiple representations.

For that, we can use generic operations that **dispatch on type** where each type corresponds to different underlying representation of data.

```scheme
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
```
rest of the implementation in [dispatch.scm](./dispatch.scm)

Problems with this technique:
1. Generic procedures must know about all data representations. When adding new type we need to modify all generic procedures.
2. Different representations are separate, but we still need to ensure they have different names.

In general, this technique is not **additive**.

## Data-directed programming

The core idea is to realize that a set of generic operations common to a set of different types can be organized as a **two-dimensional table** that contains the possible operations on one axis and the possible types on the other axis. The entries in the table are procedures that implement each operation for each type.

<p align="center">
<img width="438" alt="image" src="https://user-images.githubusercontent.com/39266310/183259765-34fb8ccc-b15e-4e1a-812e-198c373dd7e5.png">
</p>

Nothing particulary new in this approach, in the dispatch-on-type the same organization was distributed among **various conditional clauses**.

In data-directed approach generic procedures look up in the table combination of the operation and type argument and use procedures they find. Adding new operations/types doesn't require any changes to generic procedures, we only need to extend the table. 

## Message passing

In data-directed approach we organized the required dispatching on type by having each **operation** take care of its own dispatching. This decomposes the *operation-and-type* table into **rows**.

An alternative implementation strategy is to decompose the table into **columns**. Instead of using "intelligent operations" that dispatch on data types, we can work with **"intelligent data objects"** that dispatch on operation names.
