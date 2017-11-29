;append a b == 'a b
(define a '(1 2 3))
(define b '(1 2 3))
;(= a b) ;#t
(eq? a b) ;#f

(define c a)
(eq? a c) ;#t
; =  structurally equal
; eq?/equal?  same value in memory, even if same structure

;(set-car! (cdr b) b) ; (1 #0 3)     #1=1st index, 2nd
;(set! (cadr b) b) ;?? why no error


; PROVE APPEND MAKES A COPY OF A AND USES ORIGINAL B

;before
a
b

(define appendable (append a b))
(set-car! (cdr a) 'new)
(set-car! b 'original)


;after
a
b
appendable