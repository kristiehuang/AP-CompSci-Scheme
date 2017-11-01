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


;3.7


;3.8