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

;define iter
;(cond (base case) result
;      (iter (squ

; recursive (* x func)



(define (quadratic a b c)
  (define (solution1 a b c) (/ (- (sqrt (- (square b) (* 4 a c))) b) (* 2 a)))
  (define (solution2 a b c) (/ (- (- 0 b) (sqrt (- (square b) (* 4 a c)))) (* 2 a)))
  (define (discriminant a b c)
    (- (square b) (* 4 a c))
    )

  (cond ((< (discriminant a b c) 0) null)
        ((= (solution1 a b c) (solution2 a b c)) (list (solution1 a b c)))
        (else (list (solution1 a b c) (solution2 a b c)))
        )
  )



; tutor #1
(define (filtered-accumulate pred? op id term a next b)
  (cond ((> a b) id)
        ((pred? a) (op (term a) (filtered-accumulate pred? op id term (next a) next b)))
        (else (filtered-accumulate pred? op id term (next a) next b))))

(define (list-3-multiples a b)
  (define (mult-of-3? num) (= 0 (remainder num 3)))
  (filtered-accumulate mult-of-3? cons '() (lambda (x) x) a (lambda (x)(+ 1 x)) b)
  )


; tutor #2
(define (double x) (+ x x))

(define (fast-mult-iter a b)
  (define (fast-mult-iter-helper result a b)
    (cond ((< a b) (fast-mult-iter b a))
          ((= b 0) result)
          ((even? b) (fast-mult-iter-helper result (double a) (/ b 2)))
          (else (fast-mult-iter-helper (+ result a) a (- b 1)))
          )
    )

  
  (fast-mult-iter-helper 0 a b)
  )