- A **Ring buffer** also knows as **circular buffer**,**circular queue**,**cyclic buffer**, is a fixed-size abstract data type.
  
- Ring buffer uses a single fixed-sized list(array) as if it was connected end-to-end.
  
- This data structure strategically wraps around at the beginning when there are no more elements to remove at the end.

#### Ring buffer can be implemented using:
1. Fixed length list(normal array data structure in other programming languages).[we will be using list for ring buffer implementation]
2. Doubly Linked List (Although less common)

#### Common public properties:
1. **isFull** -> checks if ring buffer is full. Is full when the number of elements that have been added are equal to the length of the list.
2. **isEmpty** -> checks if ring buffer is empty. 

#### Common operation are:
1. **read** -> reads data at the current [readIndex] location in the list and advances the [readIndex] pointer one step forward. Simulates remove and return behaviour (can only read data in a forward way).
2. **write** -> writes data the current [writeIndex] location in the list and advances the [writeIndex] pointer one step forward.(can only write data in a forward way).
3. **peek** -> returns a copy(if the data is primitive eg int,double,float,string) or reference of the data which the [readIndex] is currently pointing to without advancing the [readIndex] pointer one step forward. Return null if the ring buffer is empty.

#### Applications of ring buffer:
1. Audio and video streaming
2. Network buffers
3. Keyboard and mouse input buffers
4. Digital signal processing
5. Synchronization.
6. Implement other data structures such as a queue


#### key points: