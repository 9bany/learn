# Key value store

- Key: must be unique, and the value associated with the ket can be accessed through the key. Keys can be plain text or hash values.

- Value: The value in a key-value pair can be strings, lists, objects, etc.

- Ex: Amazon dynamo, Memcached, Redis, etc.


## Contents

- [Understand the problem and astablish design scope](#understand-the-problem-and-astablish-design-scope)
- [Single server key-value store](#single-server-key-value-store)
- [Distribute key-value store](#distribute-key-value-store)
- [CAP theorem](#cap-theorem)
    - [Consistency](#consistency)
    - [Availability](#availability)
    - [Partition Tolerance](#partition-tolerance)
- [System components](#system-components)
- [Data partition](#data-partition)
- [Data replication](#data-replication)
- [Consistency](#consistency-1)
- [Inconsistency resolution: versioning](#inconsistency-resolution-versioning)
- [Handling failures](#handling-failures)
- [System architecture diagram](#system-architecture-diagram)
- [Write path](#write-path)
- [Read path](#read-path)
- [Summary](#summary)

## Understand the problem and astablish design scope

- The size of a key-value pair is small: lass than 10KB.
- Ability to store big data.
- High availability: The system responds quikly, even during failures.
- High scalability: The system can be scaled to support large data set.
- Automatic scaling: The addition/deletion of servers should be automatic base on traffic.
- Tunable consistency.
- Low latency.

## Single server key-value store
- Two optimizations can be done to fit more data in a single server: 
    - Data conpression
    - Store only frequently used data in memory and the rest on disk
## Distribute key-value store
- Distribute key-value store is also called a distributed hash table
- When designing a distributed system, it is important to understand CAP(Consistency, Availability, Partition Tolerance) theorem.
## CAP theorem
### Consistency
- Consistency means all clients see the same data at the same time no matter which node they connect to.
### Availability
- Availability means any client which requests data gets a response even if some of the nodes are down.
### Partition Tolerance
- A partition indicates a communication break between two nodes. Partition tolerance means the system continues to operate despit network partition.


Key-value stores are classified based on the two CAP characteristics the support:
- CP (consistency and partition tolerance) systems
- AP (availability and partition tolerance) systems
- CA (consistency and availability) systems

> Since network failure is unavoidable, a distributed system must tolerate network partition. Thus, a CA system cannot exist in real-world applications.

### Ideal situation
- In the ideal world, network partition never occurs. Data written to `n1` is automatically replicated to `n2` and `n3`. Both concsistency and availability are achieved.

### Real-world distributed systems
- In a distributed system, partitions cannot be avoided, and when a partition occurs, we must choose between consistency and availability.

Ex: 

## System components
## Data partition
## Data replication
## Consistency
## Inconsistency resolution: versioning
## Handling failures
## System architecture diagram
## Write path
## Read path
## Summary
