;Kristie Huang, B˚
;http://paleyontology.com/AP_CS/AP_Test1_2012_2013.html

(define (square x) (* x x))
(define (1+ x) (+ x 1))
(define (identity x) x)
(define (accumulate op id term a next b)
  (cond ((> a b) id)
        (else (op (term a)
                  (accumulate op id term (next a) next b)))))



;RECURSIVE EXPANDS CONTRACTS
;KEEPS NESTING UNTIL HIT BASE CASE

((if sqrt 1+ identity) 9)   ;??????
; if sqrt is true, then 1+. otherwise identity
; if its not false, then it is auto true

(define (perfect-square? x)
  (integer? (sqrt x))
  )

(define (fast-expt b n)
  (define (fast-expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1)))))
    )
  (fast-expt-iter 1 b n)
  )

define iter
(cond (base case) result
      (iter (squ

; recursive (* x func)