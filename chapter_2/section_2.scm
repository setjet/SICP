Exercise 2.17

(define (last-pair pair)
  (if (null? (cdr pair))
    (car pair)
    (last-pair (cdr pair))
  )
)

Exercise 2.18
(define (reverse pair)
  (if (null? pair)
    pair
    (append (reverse (cdr pair)) (list (car pair)))
  )
)

Exercise 2.19
(define (no-more? coins) (null? coins))

(define (except-first-denom coins) (cdr coins))

(define (first-denom coins) (car coins))

Exercise 2.20
(define (same-parity . i)
  (parity-iter (car i) i)
)

(define (parity-iter head i)
  (if (null? i)
    ()
    (if (= 0 (modulo (- (car i) head) 2))
      (append (list (car i)) (parity-iter head (cdr i)))
      (parity-iter head (cdr i))
    )
  )
)

Exercise 2.21
(define (square-list items)
  (if (null? items)
    ()
    (cons (* (car items) (car items)) (square-list (cdr items)))
  )
)

(define (square-list items)
  (map (lambda (x) (* x x)) items)
)

Exercise 2.22
You can't place a tail in front of a head
In this case, you can't have a list in the first element of a const

Exercise 2.23
(define (foreach f l)
  (map f l)
)

Exercise 2.24
(1, (2, (3, 4)))

Exercise 2.25
(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))

(car (car (list (list 7))))

Exercise 2.26
(1 2 3 4 5 6)
((1 2 3) 4 5 6)
((1 2 3), (4 5 6))

Exercise 2.27
(define (deep-reverse items)
  (cond ((null? items) ())
        ((pair? (car items)) (append (deep-reverse (cdr items)) (list (deep-reverse (car items)))))
        (else (append (deep-reverse (cdr items)) (list (car items))))
  )
)

Exercise 2.28
(define (fringe l)
  (cond ((null? l) ())
        ((not (pair? l)) (list l))
        (else (append (fringe (car l)) (fringe (cdr l))))
  )
)

Exercise 2.30
(define (square-tree tree)
  (cond ((null? tree) ())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))
  )
)

(define (square-tree tree)
  (map (lambda (subtree)
         (if (pair? subtree)  
            (square-tree subtree)
            (* subtree subtree)
         )
       ) 
       tree
  )
)

Exercise 2.31
(define (treemap func tree)
  (map (lambda (subtree)
         (if (pair? subtree)  
            (treemap func subtree)
            (func subtree)
         )
       ) 
       tree
  )
)

Exercise 2.33
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y) nil seuence)
)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1)
)

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)
)

Exercise 2.35
(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y)) 0 (fringe t))
)

Exercise 2.37
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m)
)

(define (transpose mat)
  (accumulate-n cons () mat))
)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)
  )
)

Exercise 2.38
(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- n 1))
      )
    )
    (enumerate-iterval 1 n)
  )
)

(define  (prime-sum-pairs n)
  (map make-pair-sum
    (filter prime-sum? (unique-pairs n))
  )
)

Exercise 2.41
(define (ordered-triples n)
  (flatmap 
    (lambda (i)
      (flatmap 
        (lambda (j)
          (map (lambda (k) (list i j k))
               (enumerate-interval 1 (- j 1))
          )
        )
        (enumerate-interval 1 (- i 1))
      )
    )
    (enumerate-interval 1 n)
  )
)

(define (ordered-triple-sum n s)
  (define (triple-sum? triple)
    (= s (accumulate + 0 triple))
  )
  (map make-triple-sum
    (filter triple-sum? (ordered-triples n))
  )
)

Exercise 2.43
Essentially same as tail recursion optimization:  by putting the enumerate as the last call, less has to be saved  on the stack compared to running the recursion on there

Exercise 2.44
(define (up-split painter n)
  (if (= n 0)
    painter
    (let ((smaller (up-split painter (- n 1))))
      (below (beside smaller smaller) painter)))))

Exercise 2.46
(define (make-vect x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))
 
(define (add-vect v1 v2) 
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) 
             (+ (ycor-vect v1) (ycor-vect v2))
  )
)

(define (sub-vect v1 v2) 
  (make-vect (- (xcor-vect v1) (xcor-vect v2)) 
             (- (ycor-vect v1) (ycor-vect v2))
  )
)

(define (scale-vect v s)
  (make-vect (* (xcor-vect v) s)
             (* (ycor-vect v) s)
  )
)


Exercise 2.47
(define (get-origin frame)
  (car frame)
)

(define (get-edge1 frame)
  (car (car frame))
)

(define (get-edge2 frame)
  (cdr (car frame))
)




