;1.30

;1.31 a

;1.32 iterative

;1.33 (part a, use odd numbers)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

((lambda (x y z) 
  (equal? (+ (* x x) (* y y)) (* z z)))
  3 4 5)