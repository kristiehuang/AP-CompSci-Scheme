;Kristie Huang, B˚

;1.30
;linear recursion
(define (next a) (+ 1 a))
(define (term x) x)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b)))
  )


;iterative
(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a))))
    )
  
  (iter a 0)
  )

;1.31 a

; procedural abstraction - generalizes PROCEDURES

(define (product-iter term a next b)
  (define (iter a result)
    (if (
         > a b) result
                (iter (next a) (* (term a) result)
                      )
                )
    )
  (iter a 1)
  )

; broken recursive code!
;(define (product term a next b)
;  (if (< a b) 0
;      (* a (product term (* (term a) (next a)) next b)
;         )))
  

(define (factorial a)

  (product-iter term 1 next a)
  )



;1.32 iterative only
(define (accumulate op op-null term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (op (term a)
                           result))
        )
    )
  (iter a op-null)
  )

;sum
(define (sum a b)
  (accumulate + 0 term a next b) )

(define (prod a b)
  (accumulate * 1 term a next b) )






;1.33a
;sum of squares of the odd numbers in a-b
(define (square x) (* x x))

(define (filtered-accumulate op op-null term a next b filter)
  (if (> a b) op-null
      (op (if (filter a) (term a) op-null) ;if a passes filter, then use a. if not, use null-value
          (filtered-accumulate op op-null term (next a) next b filter))  
      )
  )

;(filtered-accumulate + 0 square a next b odd?)

;1.33b
;express the product of all the positive integers less than n that are relatively prime
;to n (i.e., all positive integers i < n such that GCD(i,n) = 1).



(define (gcd a rem)
  
  (cond ((> rem a) (gcd rem a)))

  (if (= rem 0)
      a
      (gcd rem (remainder a rem))
      )
  )
;gcd is a logarithmic order of growth!!
; aka super fast


(define (relatively-prime? a n) (= 1 (gcd b a)))

(define (prime-filter x)
  (define (prime-filter2.0 y)
    (= 1 (gcd y x))
    )
  (filtered-accumulate * 1 term 1 next x prime-filter2.0)
    
  )
;(filtered-accumulate * 1 term a next b prime-filter)
