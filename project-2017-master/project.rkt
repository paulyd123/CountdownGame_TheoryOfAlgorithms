#lang racket

;Defining the list of numbers used to calculate the sum
;(define numbers(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

;Outputs list of numbers defined above
;numbers

;Random number generator that generates a number between the max and the min which is 100 to 1000
;(define rand(random 101 1000))

;Outputs random number between 100 and 1000
;rand

;This creates an empty list to hold the 6 numbers chosen from the new list of numbers
;(define numChosen (list))

;Defines list
(define start(list -1 -1 -1 -1 1 1 1 1))

;This removes the duplicates and creates permutations
(define perms (remove-duplicates (permutations start)))

;Here two 1s are added to the front of the list and then -1 to the end of the list 
(define (to-rpn l)
 (append (list 1 1) l (list -1)))

(map to-rpn perms)

;Applies function from above to each element of the list which in turn gets the valin rpn
(define (valid-rpn? e (s 0)) ;default value is 0
  (if (null? e)
      (if (= s 1) #t #f)
      (if (= (car e) 1)
          (valid-rpn? (cdr e) (+ s 1))
      (if (< s 2)
          #f
          (#t))))) ;tre/false

(define numbers (list 100 50 10 6 5 1))
(permutations numbers)






