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

