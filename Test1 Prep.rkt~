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