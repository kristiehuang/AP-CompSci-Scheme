(require (lib "trace.ss"))

;1.30
;linear recursion
(define (next a) (+ 1 a))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b)))
  )


;iterative
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter <??> <??>)))
  
  (iter <??> <??>)
  )

;1.31 a

; procedural abstraction - generalizes PROCEDURES





;1.32 iterative only
(define (accumulate op op-null term a next b)
(if ((< a b) op-null)
      (op (term a)
         (accumulate term (next a) next b))))
  )

;1.33 (part a, use odd numbers)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

((lambda (x y z) 
  (equal? (+ (* x x) (* y y)) (* z z)))
  3 4 5)