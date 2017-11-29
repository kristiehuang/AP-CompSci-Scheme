(define meter1
   (let ((amount 0))
      (lambda ()
         (lambda (m)
            (cond ((equal? m 'deposit)
                     (set! amount (+ amount .25)))
                  ((equal? m 'total) amount)
                  ((equal? m 'collect)
                     (let ((amt amount))
                        (set! amount 0)
                        amt))
                  (else 'Eh?))))))

;;amount is a class / static variable
;let -> lambda, creates a class variable
                   

(define meter2
   (lambda ()
      (let ((amount 0))
         (lambda (m)
            (cond ((equal? m 'deposit)
                     (set! amount (+ amount .25)))
                  ((equal? m 'total) amount)
                  ((equal? m 'collect)
                     (let ((amt amount))
                        (set! amount 0)
                        amt))
                  (else 'Eh?))))))


(define p1 (meter1))
(define p2 (meter1)) ;p1 and p2 both refer to same let variables = static/class variable
;what i perform on p1 is also performed on p2

(define q1 (meter2))
(define q2 (meter2)) ;q1 and q2 are diff instances bc defining it returns a new lambda
;q1 and q2 are two different meters
