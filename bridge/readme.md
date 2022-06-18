# Motivation
- Brige prevents a 'Cartesian product' complexity explosion
- Example:
    - Base class ThreadScheduler
    - Can be preemptive or cooperative
    - Can run on Windows or Unix
    - End up with a 2x2 scenario: WindowsPTS, UnixPTS, WindowsCTS, UnixCTS
    - Bridge pattern avoids the entity explosuion