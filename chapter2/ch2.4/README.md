# Multiple Representations for Abstract Data

## Dispatch on type

- data abstraction - generic operations, implemented in terms of abstract selectors
- representation abstraction - actual dispatch on type based on type tags
- weaknesses of this representation
    - generic procedures must know about all represnetations. When adding new type we need to modify all generic procedures
    - different representations are separate, but we still need to ensure they have different name

--> this technique is not **additivie**. 

## Data-directed programming

The core idea is to realize that a set of generic operations common to a set of different types can be organized as a two-dimensional table that contains the possible operations on one axis and the possible types on the other axis. The entries in the table are procedures that implement each operation for each type.

[add screenshot here]

Nothing new here, in the dispatch-on-type approach the same organization was distributed among various conditional clauses.

In this approach generic procedures look up in the table combination of the operation and type argument and use procedures they find. Adding new operations/types doesn't require any changes to generic procedures, we only need to extend the table. 

## Message passing


give links to specific sections or even copy selected code blocks
