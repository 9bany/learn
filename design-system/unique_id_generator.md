# Design a unique id generator in distributed system

## Requirement

- IDs must be unique
- IDs numerical values only
- IDs fit into 64bit
- IDs ordered by date
- Ability to generate over 10000 unique IDs per second

## Purpose high level design (Options)

- Multiple master replication 
- Universally unique identify (UUID)
- Ticker server
- Twitter snowflake approach

## Universally unique identify (UUID)

### Pros
- Generating UUID is sample
- The system is easy to scale because each web server is responsible for generating IDs they consume.
### Cons
- IDs are 128bit long
- IDs do not go up with time
- IDs could be non-numeric

## Ticker server
### Pros
- Numeric IDs
- It is easy to implement, and it work or small to medium scale applications
### Cons
- Single ticket server means if the ticket server goes down, all systems that depend on it will face issues. To avoid a single point of failure, we can set up multiple ticket servers. However, this will introduce new challenges such as data synchronization.

## Wrap up 

- Clock synchronization -> Network Time Protocol 

