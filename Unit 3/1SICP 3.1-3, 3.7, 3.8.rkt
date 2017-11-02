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


;3.8 broken

(define (f num)
  (define counter 0)


  
  (if (= counter 0)     
      (begin 0   (if (= num 0) (set! counter 3)
      (set! counter (+ 1 counter))))
      1)
  ;if num=1 has been evaluated before, then return 1. if not, return 0
  
  )
(+ (f 0) (f 1)) ; 0
(+ (f 1) (f 0)) ; 1
