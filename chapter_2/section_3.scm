Exercise 2.53
(a b c)
((george))
((y1 y2))
(y1 y2)
false
()
(red shoes blue socks)

Exercise 2.54
(define (equals? a b)
  (cond ((and (null? a) (null? b)) true)
        ((eq? a b) true)
        ((and (pair? a) (pair? b)) 
          (and (equals? (car a) (car b))
               (equals? (cdr a) (cdr b)) 
        ))
        (else false)
  )
)

Exercise 2.55
you are taking a quote of 'quote abcradabra', which would be quote

Exercise 2.56
(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))
(define (base x) (cadr x))
(define (exponent x) (caddr x))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        (else (list '** b e)
  )
)

Exercise 2.59
(define (union-set set1 set2)
  (cond ((null? set2) set1)
        ((element-of-set? (car set2) set1)
         (union-set set1 (cdr set2)))
        ((not (element-of-set? (car set2) set1))
         (union-set (cons (car set2) set1) (cdr set2))))
)

Exercise 2.60
Can actually be implemented in the same manner as both are valid
Efficiency would be lower as the lists can become bigger

Exercise 2.61
(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)))

Exercise 2.62
(define (union-set set1 set2)
  (if (null? set2)
    set1
    (let ((x1 (car set1)) (x2 (car set2)))
      (cond ((= x1 x2) 
              (cons x1 
                    (union-set (cdr set1) (cdr set2))))
            ((< x1 x2)               
              (cons x1 
                    (union-set (cdr set1) set2)))
            ((> x1 x2)               
              (cons x2
                    (union-set set1 (cdr set2))))

    )
  )
)




