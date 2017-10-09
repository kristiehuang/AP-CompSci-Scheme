;lambda = func w/o name

((lambda (x y z) 
  (equal? (+ (* x x) (* y y)) (* z z)))
  3 4 5)


;first-class element CAN BE
;procedures in scheme
;named by variables
;passed as arguments to procedures
;included in data structures (lists/arrays)
;returned as results of procedures

(define sq (lambda (x) (* x x)))
;define variable "sq" to be a function!!!

;"let" is lambda that is immediately executed