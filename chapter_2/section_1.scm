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



    
