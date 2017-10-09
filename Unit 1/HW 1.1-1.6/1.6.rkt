(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

;new-if is a scheme applicative-order function.
;if is a special form normal-order, where then the parameters can be evaluated as they are used.

;needs a normal order "if" that takes parameters, but that doesn't exist
;new-if is applicative-order.