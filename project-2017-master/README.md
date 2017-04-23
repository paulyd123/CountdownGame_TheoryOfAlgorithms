# Project 2017: Theory of Algorithms

### Student: *Paul Dolan*    
### Student Number: *G00297086*    
### Module: *Theory Of Algorithms*
### Course: *Software Development*
### Lecturer: *[Ian McLoughlin](https://ianmcloughlin.github.io).*

## Project Specifications
For this project we were asked to create a countdown numbers game which consists on six random numbers and a target number. The target number is a randomly generated three digit integer between 101 and 999 inclusive. The six random numbers are selected from the following list of numbers: 

<br> [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10,25,50,75,100] 

<br> Four basic operations; add, subtract, multiply and divide must be used along with 6 random numbers from the list above to calculate the target number if possible. Not all the number have to be used and if the same number appears twice in the list then that number can be used twice. 

## Project Planning
During the research stage of my project I planned on how I would approach this project. I planned on generating a random number between 100 and 1000 and then generating a list of 6 numbers which would be used along with 4 random operations in order to reach a specific number.

## How To Run The Project
In order to run this project you must first download Dr. Racket which you will find here [here](https://racket-lang.org/). Once Racket is downloaded, simply clone or download the file and open of the racket file. When the racket file opens select Run to view the output. Unfortunately I am unable to complete this project at the moment however I hope to fix this.

## Algorithms
There were many different ways I could have approached this project and perhaps the way I did approach it was incorrect as I failed to get an output.
However my aim was to first define the list of numbers that were to be used giving the label 'numbers'

> (define numbers(list 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10 25 50 75 100))

After this I then had to generate a random number as a target number that I would need to reach using the function of merging numbers and operations. I did this using the build in 'rand' function

> (define rand(random 101 1000))

After I had created a list of numbers and a random function I then went about creating a function that would take 4 numbers from the 6 random numbers and then take 2 random numbers from the list of numbers. I first had to create a list to take the list of numbers 

>(define numChosen (list))

In this function I first created a list to select 4 numbers from the list of numbers and a list for the random numbers chosen and merged these together so that when 4 numbers are chosen it saves it to the list select4Numbers. The reason for doing this was because to use Reverse Polish Notation, 2 numbers must be at the start of the equation and an operation should be at the end of the equation. 

>(define select4Numbers (list))
(define (randomListNumbers l)  
  (define randomNumber(list-ref l(random (length l))))  
  (set! l(remove randomNumber l)) 
  (set! select4Numbers (cons randomNumber select4Numbers))  
  (if (= (length select4Numbers) 4)
     select4Numbers 
      (randomListNumbers l))
)
(randomListNumbers numbers)
  
I repeated this operation to accumulate the other 2 numbers in order to get 6 numbers which is required. So for the operations I accumulated 4 operations and then 1 operation.

I then merged the lists together
> (define perms(remove-duplicates (permutations (append select4Numbers select4Ops)))

I searched the internet for an appropriate Reverse Polish Notation calculator which I found at this [site](sitehttps://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm).

>(define (calculate-RPN expr)
  (for/fold ([stack '()]) ([token expr])
    (printf "~a\t -> ~a~N" token stack)
    (match* (token stack)
     [((? number? n) s) (cons n s)]
     [('+ (list x y s ___)) (cons (+ x y) s)]
     [('- (list x y s ___)) (cons (- y x) s)]
     [('* (list x y s ___)) (cons (* x y) s)]
       [('/ (list x y s ___)) (if (= y 0)
                                (cons 0 s)
                                (if (= x 0)
                                    (cons 0 s)
                                    (cons (/ x y) s)))]
     [(x s) (error "calculate-RPN: Cannot calculate the expression:" 
                   (reverse (cons x s)))])))

I then inserted the valid-rpn function which was provided to us by our lecturer Ian McLoughlin. In this function the default stack is 0. If list e is not null and the stack is null and if the start of the equation is a number it adds one to the stack and if not it takes one off the stack. 

>(define (valid-rpn? e (s 0)) ;default value is 0, s=stack
  (if (null? e)
      (if (= s 1) #t #f)
      (if (number? (car e))
          (valid-rpn? (cdr e) (+ s 1))
      (if (> s 1)
          (valid-rpn? (cdr e) (- s 1))
          #f))))

What comes next is a condition which evaluates whether or not it is a valid reverse polish notation or not.

>(define (to-rpn l)
  (cond [(valid-rpn? (append select2Numbers l selectOp))
   (calculate-RPN (append select2Numbers l selectOp))]))
(map to-rpn perms)

I have also fully explained the code in the Racket file.

## Problems Encountered
- Laptop freezing due to large amount of memory needed to process
- Unable to reach final stage of requirements
- Lack of Racket documentation

## Conclusion
In conclusion I was disappointed I was unable to reach the final stage of this project. Due to running into various problems and not managing my time correctly. If I was to do this project again I would keep tabs of the project throughut the development and maybe try it a different way as I seemed meet a lot of problems which unfortunately lead to being unable to finish it.

## References
- https://racket-lang.org/ - Racket documentation
- http://stackoverflow.com/questions/28440442/how-to-merge-2-lists-into-one-in-racket - Merging lists
- https://rosettacode.org/wiki/Parsing/RPN_calculator_algorithm - RPN Calculator
- http://beautifulracket.com/stacker/ - Help with stacks
- http://stackoverflow.com/questions/20319593/creating-permutation-of-a-list-in-scheme - Permutations
- https://www.youtube.com/watch?v=bAZq8dg6xlc - Racket YouTube video
- https://docs.racket-lang.org/reference/generic-numbers.html - Random function
- http://stackoverflow.com/questions/14617095/how-to-use-append-map-in-racket-scheme - Mapping lists
