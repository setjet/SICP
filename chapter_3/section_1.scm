Exercise 3.1
(define (make-accumulator state)
  (lambda (input) (begin (set! state (+ state input)) state))
)

Exercise 3.2
(define (make-monitored f)
  (define count 0)
  (define (dispatch input)
    (cond ((eq? input 'how-many-calls?) count)
          (else (begin (set! count (+ count 1)) (f input)))
    )
  )
  dispatch
)

Exercise 3.3
(define (make-account balance password)
  (define (withdraw amount) (begin (set! balance (- balance amount)) balance))
  (define (deposit amount) (begin (set! balance (+ balance amount)) balance))

  (define (dispatch pw action)
    (cond ((not (eq? pw password)) (display "Incorrect password"))
          ((eq? action 'withdraw) (withdraw))
          ((eq? action 'deposit) (deposit))
    )
  )
  dispatch
)

Exercise 3.4
(define (make-account balance password)
  (define invalid-count 0)
  (define (wrong-pw) 
    (if (> invalid-count 6)
        call-the-cops
        (set! invalid-count (+ invalid-coun 1))))
  (define (correct-pw) (set! invalid-count 0))
  
  (define (withdraw amount) (begin (set! balance (- balance amount)) balance))
  (define (deposit amount) (begin (set! balance (+ balance amount)) balance))

  (define (dispatch pw action)
    (cond ((not (eq? pw password)) (begin (display "Incorrect password") wrong-pw))
          ((eq? action 'withdraw) (begin correct-pw withdraw))
          ((eq? action 'deposit) (begin correct-pw deposit))
    )
  )
  dispatch
)

Exercise 3.5
(define (estimate-integral predicate x1 y1 x2 y2 trials)
  (define area (* (abs (- x1 x2)) (abs (- y1 y2)))
  (define fraction (monte-carlo trials predicate)
  (* area fraction)
)

Exercise 3.7
(define (make-account balance password)
  (define (withdraw amount) (begin (set! balance (- balance amount)) balance))
  (define (deposit amount) (begin (set! balance (+ balance amount)) balance))
  (define (set-password new-pw) (set! password new-pw))

  (define (dispatch pw action)
    (cond ((not (eq? pw password)) (display "Incorrect password"))
          ((eq? action 'withdraw) (withdraw))
          ((eq? action 'deposit) (deposit))
          ((eq? action 'set-pw) (set-password new-pw))
    )
  )
  dispatch
)

(define (make-joint account old-pw new-pw)
  ((account old-pw 'set-pw) new-pw)
)
