A **Ring buffer** also knows as **Circular buffer**, is a fixed size **list**.
This data structure strategically wraps around at the beginning when there are no more items to remove at the end.



#### common operation are:
1. **read** -> reads data at the current [readIndex] in the list and advances the [readIndex] pointer one step forward.(can only read data in a forwards way)
2. **write** -> writes data the current [writeIndex] in the list and advances the [writeIndex] pointer one step forward.(can only write data in a forward way).
3. **isEmpty** -> checks if ring buffer is empty.
4. **isFull** -> checks if ring buffer is full. is full when the number of elements that have been added are equal to the length of the list. List(array data structure) is used internally to implement a ring buffer.
5. **peek** -> returns a copy(if the data is primitive eg int,double,float,string) or reference of the data which the [readIndex] is pointing to without advancing the [readIndex] pointer one step forward.Return null if the ring buffer is empty.

##### applications of ring buffer 
1. audio and video streaming
2. network buffers
3. keyboard and mouse input buffers
4. Digital signal processing
5. Synchronization


##### key points