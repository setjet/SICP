Exercise 1.9
(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))


(+ 4 5)
(inc (+ 3 5)
(inc (inc (+ 2 5)))
(inc (inc (inc (+ 1 5))))
(inc (inc (inc (inc (+ 0 5)))))
(inc (inc (inc (inc 5))))
(inc (inc (inc 6)))
(inc (inc 7))
(inc 8)
9   


(define (+ a b)
  (if (= a 0)
     b
     (= (dec a) (inc b))))

(+ 4 5)
(+ 3 6)
(+ 2 7)
(+ 1 8)
(+ 0 9)
9

The first process is recursive while the second is linear

Exercise 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) => (A 0 (A 1 9)) .. => (A 0 (A 0 (A 0 .... (A 0 2)))) =>  (* 2 (* 2 (* 2 .... (* 2 2)))) => 2^10 = 1024
(A 2 4) => (A 1 (A 2 3) => (A 1 (A 1 (A 2 2))) => (A 1 (A 1 (A 1 (A 2 1)))) =>  (A 1 (A 1 (A 1 2))) => (A 1 (A 1 (A 0 (A 1 1)))) = > (A 1 (A 1 (A 0 2))) => (A 1 (A 1 4)) => 2^2^2^2 = 65536
(A 3 3) => (A 2 (A 3 2)) => (A 2 (A 2 (A 2 1)) => (A 2 (A 2 2)) => (A 2 (A 1 (A 2 1)) => (A 2 (A 1 2)) => (A 2 (A 0 (A 1 1))) => (A 2 (A 0 2)) => (A 2 4) = 65536

(define (f n) (A 0 n)): (f n) = 2 * n
(define (g n) (A 1 n)): (g n) = 2 ^ n
(define (h n) (A 2 n)): (h n) = 2 ^^ n (tetration)

Exercise 1.11
(define (f n)
  (if (< n 3)
    n
    (f-iter 0 1 2 n)))


(define (f-iter a b c n)
  (if (= n 3)
    (+ c (* 2 b) (* 3 a))
    (f-iter b c (+ c (* 2 b) (* 3 a)) (- n 1))
  )
)

Exercise 1.12
(define (pascal x y)
  (if (or (= x 1) (= x y))
    1
    (+ (pascal x (- y 1)) (pascal (- x 1) (- y 1)))
  )
)

Exercise 1.13
exponential in both time and space

Exercise 1.15
a 41 times 
b space and time is both linear

Exercise 1.16
(define (fast-expt b n)
  (fast-iter b n 1)
)

(define (fast-iter b n t)
  (cond ((= n 0) t)
        ((even? n) (fast-iter (* b b) (/ n 2) t))
        (else (fast-iter b (- n 1) (* b t)))
  )
)

Exercise 1.17
(define (half a)
  (/ a 2)
)

(define (multiply a b)
  (multiply-log a b 0)
)

(define (multiply-log a b total)
  (cond ((= a 0) (* b total))
        ((even? a) (multiply-log (half a) b (+ total (half a))))
        (else (multiply-log (- a 1) b (+ total 1)))
  )
)

Exercise 1.20
In both normal order and applicative order execution remainder would be required to be called 4 times. 

Exercise 1.26
expmod is now called twice and then multiplied, instead of once and then multiplied by itself

