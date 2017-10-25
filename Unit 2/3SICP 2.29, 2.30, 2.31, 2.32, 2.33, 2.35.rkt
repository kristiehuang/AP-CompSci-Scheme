;Kristie Huang, B˚


(define make-mobile list)


(define make-branch list)
(define len car)
(define struct cadr)

(define weight? number?)
(define mobile? pair?)

; Here is a test mobile so we can have a sample input to the
; programs, below.  Note that we must adhere to the abstractions.

(define m
  (make-mobile
   (make-branch 6
                (make-mobile
                 (make-branch 1 8)
                 (make-branch 4 2)))
   (make-branch 5 12)))

;2.29 a
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))
(define (branch-struct branch) (cadr branch))


;2.29 b
(define (total-weight mob)
  (define (weight branch)
    (cond
      ((weight? branch) branch)
      ((mobile? branch) (total-weight branch))
      )
    )

  (+ (weight (branch-struct (left-branch mob))) (weight (branch-struct (right-branch mob))))
  )

;2.29 c


(define (balanced? mob)


  (define (torque branch)
    (if 
     (weight? (branch-struct branch)) (* (branch-length branch) (branch-struct branch))
  
     (* (branch-length branch) (total-weight (branch-struct branch)))
     )
    )
  
  (define (branch-balanced? branch)
    (cond
      ((weight? branch) #t)
      ((mobile? branch) (balanced? branch))
      )
    )
    
  (and (= (torque (left-branch mob)) (torque (right-branch mob))) (branch-balanced? (branch-struct (left-branch mob))) (branch-balanced? (branch-struct (right-branch mob))))

  
  )

(trace balanced?)
(trace total-weight)



;2.29 d
;if using cons instead of list, use cadr instead of cadr to get the last value in the list.



;2.30



;2.31



;2.32



;2.33



;2.35