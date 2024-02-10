// challenge 1: select the Right One
// work out by hand the steps that a selection sort would perform in the list.

// random distribution: [4, 2, 5, 1, 3]

// ascending selection sort
// [4, 2, 5, 1, 3] compare 4 and the 1st smallest value 1, since 1 is less than 4, swap the two
// [1, 2, 5, 4, 3] compare 2 and the 2nd smallest value 2, since 2 is equal to 2, no swapping
// [1, 2, 5, 4, 3] compare 5 and the 3rd smallest value 3, since 3 is less than 5, swap the two
// [1, 2, 3, 4, 5] compare 4 and the 4th smallest value 4, since 4 is equal to 4, no swapping
// [1, 2, 3, 4, 5] compare 5 and the 5th smallest value 5, since 5 is equal to 5, no swapping: sorting is done.