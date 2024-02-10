// challenge 1: insert Here
// work out by hand the steps that a insertion sort would perform in the list.

// random distribution: [4, 2, 5, 1, 3]

// ascending insertion sort
// [4, 2, 5, 1, 3] compare 2 and 4, since 2 is less than 4, swap the two
// [2, 4, 5, 1, 3] compare 5 and 4, since 5 is greater than 4, no swapping
// [2, 4, 5, 1, 3] compare 1 and 5, since 1 is less than 5 swap the two
// [2, 4, 1, 5, 3] compare 1 and 4, since 1 is less than 4, swap the two
// [2, 1, 4, 5, 3] compare 1 and 2, since 1 is less than 2, swap the two
// [1, 2, 4, 5, 3] compare 3 and 5, since 3 is less than 5, swap the two
// [1, 2, 4, 3, 5] compare 3 and 4, since 3 is less than 4, swap the two
// [1, 2, 3, 4, 5] compare 3 and 2, since 3 is greater than 2, no swapping : sorting is done