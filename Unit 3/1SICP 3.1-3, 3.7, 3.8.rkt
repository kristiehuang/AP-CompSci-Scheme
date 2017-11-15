;3.1, 3.2, 3.3, 3.7, 3.8
;B˚ / Kristie Huang


;3.1
(define (make-accumulator initial)
  (lambda (addend) (set! initial (+ initial addend))
    initial)
  )

;3.2
(define (make-monitored func)
  (define counter 0)
  (lambda (m)
    (cond
      ((eq? m 'reset-count) (set! counter 0))
      ((eq? m 'how-many-calls?) counter)
      (else (begin (set! counter (+ 1 counter)) (func m)  ))
      )
    )
  )
 

;3.3
(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))

  (lambda (p m) (if (eq? p password) (dispatch m) (error "incorrect password")))
  )




;3.7

(define (make-joint acc pass newpass)
  (cond
    ;if acc w/ pass exists, then do that. if not then u cant access
    ((number? ((acc pass 'deposit) 0))

     (lambda (enter-pass m) (if (eq? enter-pass newpass) (acc pass m) (error "incorrect pass"))))
    (else (error "u cant access this acc sry")))
  )

(define peter-acc (make-account 50 'open-sesame))

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

;((peter-acc 'pass 'deposit) 50)
;((paul-acc 'newpass 'deposit) 50)


;3.8 help

(define f ;paley
  (let ((state-variable -1))
    (lambda (n)
      (cond ((= n 0) (set! state-variable (+ state-variable 1))
                     state-variable)
            (else state-variable))))
  )

;if bool
(define f-bool
  (let ((state-variable #f))
    (lambda (n)
      (cond ((= n 0) (set! state-variable (not state-variable))
                     state-variable)
            (else state-variable)))))


;state-varialbe can be bool too
;how let & lambda work in 3.8
;state-variable??


(define f2 ;michael
  (let ((previous 1)) ;previous = 1
    (lambda (x)
      (let ((return-val (* previous x)))
        (set! previous x) return-val)   )
    )
  )


(+ (f 0) (f 1)) ; 0
(+ (f 1) (f 0)) ; 1

(+ (f2 0) (f2 1)) ; 0
(+ (f2 1) (f2 0)) ; 1


(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))


(define (make-withdraw initial-amount)
  ((lambda (balance) 
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))) initial-amount)
  )

(define W1 (make-withdraw 100))

(W1 50)

(define W2 (make-withdraw 100))