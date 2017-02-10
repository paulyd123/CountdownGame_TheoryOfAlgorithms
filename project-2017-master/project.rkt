#lang racket

;Defining the list of numbers used to calculate the sum
(define numbers(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;Outputs list of numbers defined above
numbers

;Random number generator that generates a number between the max and the min which is 100 to 1000
(define rand(random 101 1000))

;Outputs random number between 100 and 1000
rand

;Creates an empty list to hold the 6 numbers chosen from the list of numbers
(define numChosen (list))






