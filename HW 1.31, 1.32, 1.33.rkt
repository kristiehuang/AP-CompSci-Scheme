(require (lib "trace.ss"))

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






;1.33 (part a, use odd numbers)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

((lambda (x y z) 
   (equal? (+ (* x x) (* y y)) (* z z)))
 3 4 5)