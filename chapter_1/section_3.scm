Exercise 1.29
(define (inc n) (+ n 1))

(define (inc2 n) (+ n 2))  

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b)
    )
  )
)


(define (cube x) (* x x x))

(define (simpson f a b n)
  (define (h) 
    (/ (- b a) n)
  ) 
  (define (param k) 
    (+ a (* k (h)))
  ) 
  (define (f-inner k)
    (f (param k))
  )
  ( * (/ (h) 3)
    (+ (f (param 0))
       (* 4 (sum f-inner 1 inc2 (- n 1)))
       (* 2 (sum f-inner 2 inc2 (- n 1)))
       (f (param n))
    )
  )
)

Exercise 1.30
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

Exercise 1.31
a
(define (product term a next b)
  (define (iter a result)
    (if  (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)

b
(define (product term a next b)
  (if (> a b)
    1
    (+ (term a)
      (sum term (next a) next b)
    )
  )
)

Exercise 1.32
a
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))
    )
  )
  (iter a null-value)
)

b
(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
      (accumlate combiner null-value term (next a) next b)
  )
)


Exercise 1.33
(define (filtered-accumulate filter combiner null-value term a next b)
  (if (> a b)
    null-value
    (if (filter a)
      (combiner (term a)
        (accumulate filter combiner null-value term (next a) next b)
      )
    )
  )
)
(filtered-accumulate prime + 0 square a inc b)

Exercise 1.34
It would give an error:
(f f) => (f (f 2)) => (f (2 2)) 
(2 2) is invalid so it will break

Exercise 1.36
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display guess)
      (if (close-enough? guess next)
        next
        (try next)
      )
    )
  )
  (try first-guess)
)

(define (average x y) (/ (+ x y) 2))

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 
             2.0)

Averaging out reduces the number of steps by roughly 60%

Exercise 1.37
a
(define  (func n d x) (/ n (+ d x)))

(define (cont-frac n d k) (cont-frac-rec n d 1 k))

(define (cont-frac-rec n d i k)
  (if (= i k)
    (func (n i) (d i) 0)
    (func (n i) (d i) (cont-frac-rec n d (+ i 1) k))
  )
)

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100)

b
(define  (func n d x) (/ n (+ d x)))

(define (cont-frac n d k) (cont-frac-iter n d k 0))

(define (cont-frac-iter n d k result) 
  (if (= k 1)
    (func (n k) (d k) result)
    (cont-frac-iter n d (- k 1) (func (n k) (d k) result))
  )
)

(cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 100000)

Exercise 1.38
(define (euler-d i)
  (if (= 0 (modulo (- i 2) 3))
    (* (+ (/ (- i 2) 3) 1) 2)
    1
  )
)

(cont-frac (lambda (i) 1.0) euler-d 100)

Exercise 1.39
(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) x (* x x))) (lambda (i) (- (* i 2) 1)) k)
)

Exercise 1.40
(define (cubic a b c)
  (lambda (x)
    (+ (* x x x)
       (* a x x)
       (* b x)
       c)
  )
)

Exercise 1.41
(define (double f) (lambda (x) (f (f x))))

Exercise 1.42
(define (compose f g) (lambda (x) (f (g x))))


Exercise 1.43
(define (repeated f n) 
  (if (= n 1)
      (lambda (x) (f x))
      (compose f (repeated f (- n 1)))
  )
)

Exercise 1.44
(define (smooth f) (lambda (x) (/ (+ (f x) (f (- x dx))))))
(define (n-smooth f n) (lambda (x) ((repeated smooth n) f)

