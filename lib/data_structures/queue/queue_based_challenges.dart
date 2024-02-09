import 'package:dart_data_structure_and_algorithm/data_structures/queue/ring_buffer_based_queue_implementation.dart';

// challenge 1: stack vs queue.
// Explain the difference between a stack and a queue. Provides two real-life examples for each data structure.

// Difference:
// A stack is a data structure that uses the LIFO(last in first out) principle.Items are inserted at the top
// and removed from the top WHILE a queue is a data structure that uses the FIFO(first in first out) principle.
// items are inserted from the back and removed from the front.

// Two real-life examples of stack.
/* 
1. Function call in programming -> When a function is called in a program, its execution context(local variables, arguments, return address, etc)
   is pushed on to the stack. When the function returns, its context is popped from the stack, ensuring proper execution flow.
2. Browser history -> When you visit websites in on one tab, the browser stores the pages in a stack. Clicking the back button takes you to the
   recently visited page.
*/

// challenge 2: step by step diagrams
// given the following queue where the left is the front of the queue and the right is the back:
/* 
  _____________________
  |   |   |   |   |   |
  | S | P | E | E | D |
  |___|___|___|___|___| 
    
*/
// provide step-by-step diagrams showing how the following series of commands affects the queue internally.
/* 
  queue.enqueue('D');
  queue.enqueue('A');
  queue.dequeue();
  queue.enqueue('R');
  queue.dequeue();
  queue.dequeue();
  queue.enqueue('T');

*/
// Do this for each of the following queue implementation:
/*
  1. single_list
  2. double_list
  3. singly_linked_list
  4. ring_buffer 
*/
// assume the list and the ring buffer have an initial size of 5.

// 1. Single_list step-by-step diagrams
/* 
  Nb: since the initial size of this list is 5 and is already full, trying to enqueue a value will lead to 
      dart first doubling the size of the list in order to create more space for other values.
  _____________________
  |   |   |   |   |   |
  | S | P | E | E | D |
  |___|___|___|___|___|
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | S | P | E | E | D | D |   |   |   |   |
  |___|___|___|___|___|___|___|___|___|___| 
                       /|\
                        |____ queue.enqueue('D');
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | S | P | E | E | D | D | A |   |   |   |
  |___|___|___|___|___|___|___|___|___|___| 
                           /|\
                            |____ queue.enqueue('A');
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | S | P | E | E | D | D | A |   |   |   |
  |___|___|___|___|___|___|___|___|___|___| 
   /|\
    |____ queue.dequeue();
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | P | E | E | D | D | A |   |   |   |   |
  |___|___|___|___|___|___|___|___|___|___| 
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | P | E | E | D | D | A | R |   |   |   |
  |___|___|___|___|___|___|___|___|___|___| 
                           /|\
                            |____ queue.enqueue('R');
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | P | E | E | D | D | A | R |   |   |   |
  |___|___|___|___|___|___|___|___|___|___| 
   /|\
    |____ queue.dequeue();
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | E | E | D | D | A | R |   |   |   |   |
  |___|___|___|___|___|___|___|___|___|___|
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | E | E | D | D | A | R |   |   |   |   |
  |___|___|___|___|___|___|___|___|___|___|
   /|\
    |____ queue.dequeue();
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | E | D | D | A | R |   |   |   |   |   |
  |___|___|___|___|___|___|___|___|___|___|
  _________________________________________
  |   |   |   |   |   |   |   |   |   |   |
  | E | D | D | A | R | T |   |   |   |   |
  |___|___|___|___|___|___|___|___|___|___|
                       /|\
                        |____ queue.enqueue('T');
*/

// 2. Singly_linked_list step-by-step diagrams
/*  
  _____     _____    _____    _____    _____
  |   |     |   |    |   |    |   |    |   |
  | S | --> | P | -->| E | -->| E | -->| D | 
  |___|     |___|    |___|    |___|    |___|
  _____     _____    _____    _____    _____    _____
  |   |     |   |    |   |    |   |    |   |    |   |
  | S | --> | P | -->| E | -->| E | -->| D | -->| D |
  |___|     |___|    |___|    |___|    |___|    |___|
                                                 /|\
                                                  |____ queue.enqueue('D');
  _____     _____    _____    _____    _____    _____    _____ 
  |   |     |   |    |   |    |   |    |   |    |   |    |   | 
  | S | --> | P | -->| E | -->| E | -->| D | -->| D | -->| A |
  |___|     |___|    |___|    |___|    |___|    |___|    |___| 
                                                          /|\
                                                           |____ queue.enqueue('A');
  _____     _____    _____    _____    _____    _____    _____ 
  |   |     |   |    |   |    |   |    |   |    |   |    |   | 
  | S | --> | P | -->| E | -->| E | -->| D | -->| D | -->| A |
  |___|     |___|    |___|    |___|    |___|    |___|    |___| 
   /|\
    |____ queue.dequeue();
  _____    _____    _____    _____    _____    _____ 
  |   |    |   |    |   |    |   |    |   |    |   | 
  | P | -->| E | -->| E | -->| D | -->| D | -->| A |
  |___|    |___|    |___|    |___|    |___|    |___|
  _____    _____    _____    _____    _____    _____    _____
  |   |    |   |    |   |    |   |    |   |    |   |    |   |
  | P | -->| E | -->| E | -->| D | -->| D | -->| A | -->| R | 
  |___|    |___|    |___|    |___|    |___|    |___|    |___|
                                                         /|\
                                                          |____ queue.enqueue('R');
  _____    _____    _____    _____    _____    _____    _____
  |   |    |   |    |   |    |   |    |   |    |   |    |   |
  | P | -->| E | -->| E | -->| D | -->| D | -->| A | -->| R | 
  |___|    |___|    |___|    |___|    |___|    |___|    |___|
   /|\
    |____ queue.dequeue();
  _____    _____    _____    _____    _____    _____
  |   |    |   |    |   |    |   |    |   |    |   |
  | E | -->| E | -->| D | -->| D | -->| A | -->| R | 
  |___|    |___|    |___|    |___|    |___|    |___|                                                        
  _____    _____    _____    _____    _____    _____    _____
  |   |    |   |    |   |    |   |    |   |    |   |    |   |
  | E | -->| E | -->| D | -->| D | -->| A | -->| R | -->| T | 
  |___|    |___|    |___|    |___|    |___|    |___|    |___|
                                                         /|\
                                                          |____ queue.enqueue('T');                                             
                                                  
*/

// 3. Ring_buffer step-by-step diagrams.
/* 
  Nb: ring_buffer is a fixed size list. since the initial size is 5, ring_buffer wont grow
  r -> read
  w -> write
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   S   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
   /|\ /|\
    |   |
    w   r
    
  queue.enqueue('D'); returns false 
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   S   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
   /|\ /|\
    |   |
    w   r

  queue.enqueue('A'); returns false 
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   S   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
   /|\ /|\
    |   |
    w   r
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   S   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
   /|\ /|\
    |   |
    w   r__queue.dequeue(); 
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   S   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
     /|\          /|\
      |            |
      w            r
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   S   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
     /|\          /|\
      |            |
      |            r
      |
      w__queue.enqueue('R');
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   R   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
                /|\ /|\
                 |   |
                 w   r
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   R   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
                /|\ /|\
                 |   |
                 w   r__queue.dequeue();
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   R   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
                  /|\          /|\
                   |            |
                   w            r
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   R   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
                  /|\          /|\
                   |            |
                   w            r__queue.dequeue();
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   R   | -->|   P   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
                  /|\                       /|\
                   |                         |
                   w                         r
  _________    _________    _________    _________    _________
  |       |    |       |    |       |    |       |    |       |
  |   R   | -->|   T   | -->|   E   | -->|   E   | -->|   D   |
  |_______|    |_______|    |_______|    |_______|    |_______|
                               /|\          /|\
                                |            |
                                w            r                 

*/

// 4. Double_list step-by-step diagrams.
/* 
  left list for dequeue             right list for enqueue
  _____________________             _____________________
  |   |   |   |   |   |             |   |   |   |   |   |
  |   |   |   |   |   |             | S | P | E | E | D |
  |___|___|___|___|___|             |___|___|___|___|___|

  left list for dequeue             right list for enqueue
  _____________________             _________________________________________
  |   |   |   |   |   |             |   |   |   |   |   |   |   |   |   |   |
  |   |   |   |   |   |             | S | P | E | E | D | D |   |   |   |   |
  |___|___|___|___|___|             |___|___|___|___|___|___|___|___|___|___|
                                                         /|\
                                                          |____ queue.enqueue('D');

  left list for dequeue             right list for enqueue
  _____________________             _________________________________________
  |   |   |   |   |   |             |   |   |   |   |   |   |   |   |   |   |
  |   |   |   |   |   |             | S | P | E | E | D | D | A |   |   |   |
  |___|___|___|___|___|             |___|___|___|___|___|___|___|___|___|___|
                                                             /|\
                                                              |____ queue.enqueue('A');
  
  left list for dequeue             right list for enqueue
  _____________________             _________________________________________
  |   |   |   |   |   |             |   |   |   |   |   |   |   |   |   |   |
  |   |   |   |   |   |             | S | P | E | E | D | D | A |   |   |   |
  |___|___|___|___|___|             |___|___|___|___|___|___|___|___|___|___|

Nb: dequeuing the first time will result in copying the reversed right list into the left list.

    left list for dequeue                                 right list for enqueue
  _________________________________________               
  |   |   |   |   |   |   |   |   |   |   |               * when right list is clears, dart reclaims the
  | A | D | D | E | E | P | S |   |   |   |                 memory, and the right list becomes empty
  |___|___|___|___|___|___|___|___|___|___|               

    left list for dequeue                                 right list for enqueue
  _________________________________________               
  |   |   |   |   |   |   |   |   |   |   |               * right list is empty
  | A | D | D | E | E | P | S |   |   |   |                
  |___|___|___|___|___|___|___|___|___|___|               
                           /|\
                            |____ queue.dequeue();
    left list for dequeue                                 right list for enqueue
  _________________________________________               
  |   |   |   |   |   |   |   |   |   |   |               * right list is empty
  | A | D | D | E | E | P |   |   |   |   |               
  |___|___|___|___|___|___|___|___|___|___|               

    left list for dequeue                                 right list for enqueue
  _________________________________________               _____
  |   |   |   |   |   |   |   |   |   |   |               |   |
  | A | D | D | E | E | P |   |   |   |   |               | R |
  |___|___|___|___|___|___|___|___|___|___|               |___|
                                                           /|\
                                                            |____ queue.enqueue('R');

    left list for dequeue                                 right list for enqueue
  _________________________________________               _________
  |   |   |   |   |   |   |   |   |   |   |               |   |   |
  | A | D | D | E | E | P |   |   |   |   |               | R |   |
  |___|___|___|___|___|___|___|___|___|___|               |___|___|
                       /|\
                        |____ queue.dequeue();

    left list for dequeue                                 right list for enqueue
  _________________________________________               _________
  |   |   |   |   |   |   |   |   |   |   |               |   |   |
  | A | D | D | E | E |   |   |   |   |   |               | R |   |
  |___|___|___|___|___|___|___|___|___|___|               |___|___|
                   /|\
                    |____ queue.dequeue();

    left list for dequeue                                 right list for enqueue
  _________________________________________               _________
  |   |   |   |   |   |   |   |   |   |   |               |   |   |
  | A | D | D | E |   |   |   |   |   |   |               | R |   |
  |___|___|___|___|___|___|___|___|___|___|               |___|___|

    left list for dequeue                                 right list for enqueue
  _________________________________________               _________________
  |   |   |   |   |   |   |   |   |   |   |               |   |   |   |   |
  | A | D | D | E |   |   |   |   |   |   |               | R | T |   |   |
  |___|___|___|___|___|___|___|___|___|___|               |___|___|___|___|
                                                               /|\
                                                                |____ queue.enqueue('T'); 

  Nb: you can represent the 2 lists as a 2 stacks for simple visualization              
*/

// challenge 3: whose turn is it
/* 
  imagine you are playing a game of monopoly with your friends. The problem is everyone always forgets who
  turn it is! Create a monopoly organizer that always tells you whose turn it is.
*/

extension BoardGameManager<E> on QueueRingBuffer {
  E? nextPlayer() {
    E? nextPlayer = dequeue();
    enqueue(nextPlayer);
    return nextPlayer;
  }
}


// challenge 4: Double-ended queue (deque)
// build a deque
// check under lib/data_structures/deque