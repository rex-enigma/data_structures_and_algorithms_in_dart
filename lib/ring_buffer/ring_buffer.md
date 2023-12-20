A <b>Ring buffer</b> also knows as <b>Circular buffer</b>, is a fixed size list.
This data structure strategically wraps around at the beginning when there are no more items to remove at the end.



#### common operation are:
1. read -> reads data at the current [readIndex] in the list and advances the readIndex pointer one step forward.(can only read data in a forwards way)
2. write -> writes data the current [writeIndex] in the list and advances the writeIndex pointer one step forward.(can only write data in a forward way)
3. peek -> returns a copy(if the data is primitive eg int,double,float,string) or reference of the data which the readIndex is pointing to without advancing the readIndex pointer one step forward. 