// challenge 1: bubble up
// work out by hand the steps that a bubble sort would perform in the list.

// random distribution: [4, 2, 5, 1, 3]

// ascending bubble sort 
// [4, 2, 5, 1, 3] compare 4 and 2, since 2 is less than 4, swap the two
// [2, 4, 5, 1, 3] compare 4 and 5, since 5 is greater than 4, no swapping
// [2, 4, 5, 1, 3] compare 5 and 1, since 1 is less than 5, swap the two
// [2, 4, 1, 5, 3] compare 5 and 3, since 3 is less than 5, swap the two : 1st pass
// [2, 4, 1, 3, 5] compare 2 and 4, since 4 is greater than 2, no swapping
// [2, 4, 1, 3, 5] compare 4 and 1, since 1 is less than 4, swap the two
// [2, 1, 4, 3, 5] compare 4 and 3, since 3 is less than 4, swap the two 
// [2, 1, 3, 4, 5] compare 4 and 5, since 5 is greater than 5, no swapping : 2nd pass
// [2, 1, 3, 4, 5] compare 2 and 1, since 1 is less than 2, swap the two
// [1, 2, 3, 4, 5] compare 2 and 3, since 3 is greater than 2, no swapping
// [1, 2, 3, 4, 5] compare 3 and 4, since 4 is greater than 3, no swapping
// [1, 2, 3, 4, 5] compare 5 and 4, since 5 is greater than 4, no swapping : sorting is done