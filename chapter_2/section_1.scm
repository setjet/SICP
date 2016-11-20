Exercise 2.1
(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
        (cons (/ (* -1 n) g) (/ (* -1 d) g))
        (cons (/ n g) (/ d g))
    )
  )
)

Exercise 2.2
(define (make-segment a b) (cons a b))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p)

(define (average a b) (/ (+ a b) 2))
(define (midpoint-segment s)
    (make-point (average (x-point (start-segment s)) (x-point (end-segment s)))
                (average (y-point (start-segment s)) (y-point (end-segment s)))
    )
)

(define (print-point p)
   (newline)
   (display "(")
   (display (x-point p))
   (display ",")
   (display (y-point p))
   (display ")"))


Exercise 2.4
(define (cdr z) (z (lambda (p q) q)))

Exercise 2.6
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (plus m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x))))
)

Exercise 2.7
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

Exercise 2.8
(define sub-interval x y)
  (make-interval (- (lower-bound x) (higher-bound y))
                 (- (upper-bound x) (lower-bound y))
  )
)

Exercise 2.10
(define (div-interval x y)
  (if (or (= 0 (lower-bound y)) (= 0 (upper-bound y)))
      (display "Cannot divide by 0")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y)) 
                                   (/ 1.0 (upper-bound y))
                    )
      )
  )
)                             

Exercise 2.12
(define (make-center-percent c p)
  (make-interval (- (center c) (* p (center c)))
                 (+ (center c) (* p (center c)))
  )
)

(define (percent interval)
  (/ (upper-bound interval) (center interval))
)

Exercise 2.14-2.16
She is right because r1 and r2 are used more often in par1. As a result, any uncertainty in r1 and r2 are amplified

