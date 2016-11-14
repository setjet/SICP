Exercise 1.1

10 => 10
(+ 5 3 4) => 12
(- 9 1) => 8
(/ 6 2) => 3
(+ (* 2 4) (- 4 6)) => 6
(define a 3) => a
(define b (+ a 1)) => b
(+ a b (* a b)) => 19
(= a b) => false
(if (and (> b a) (< b (* a b)))
    b
    a) => b => 4
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) => 16
(+ 2 (if (> b a) b a)) => 6
(* (cond ((> a b) a)
         ((< a b) b)
         (else - 1))
   (+ a 1)) => 16

Exercise 1.2
(/ (+ 5
      4 
      (- 2 
         (- 3 
            (+ 6 
               (/ 4 5)
            )
         )
      )
   ) 
   (* 3 
      (- 6 2)
      (- 2 7))
)

Exercise 1.3
(define (sum_sq_of_max_two x y z)
   (define (max a b) (if (< a b) b a))
   (define (min a b) (if (< a b) a b))
   (define (sq a) (* a a))
   (+ (sq (max x y)) 
      (sq (max z (min x y))))
) 

Exercise 1.4
The operator to combine a and b is determined wether b is negative or positive

Exercise 1.5
Using applicative-order evaluation, the function will simply return 0.
Normal-order evaluation however will result in an infinite loop, as it will try to keep expanding (p)

Exercise 1.6
This will result in an infinite loop because the cond returns the complete expression, whereas the if expression returns the value of the expression. In case of the cond, the expression never has the opportunity to be evaluated

Exercise 1.8
(define (cube x)
   (* x x x))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess x)
 (< (abs (- (cube guess) x)) 0.001))

(define (crt-iter guess x)
  (if (good-enough? guess x)
     guess 
     (crt-iter (improve guess x)
                x)))

(define (crt x)
   (crt-iter 1.0 x))

