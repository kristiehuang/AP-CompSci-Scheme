(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))





;applicative order: compiler tries to evaluate (define p p) and would fail, never goes into program
;normal order: 0