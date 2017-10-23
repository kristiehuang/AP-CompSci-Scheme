;closure

(cons 1 2) ; CREATES ONE PAIR -- '(1 . 2)


; LIST
; creates as many pairs as it has inputs.. final pair is an empty list in cdr
; list = chain of pairs connected by cdrs

'() ; empty list - single box, not a pair

'(1 2)
(list 1 2)
(cons 1 (cons 2 '())) ; (1 (2 '()))
(cons 1 (list 2 '()))

(define (f a b . c) c)
; (f 1 2 3 4 5)

(define (g . list) list)
;takes any number of inputs