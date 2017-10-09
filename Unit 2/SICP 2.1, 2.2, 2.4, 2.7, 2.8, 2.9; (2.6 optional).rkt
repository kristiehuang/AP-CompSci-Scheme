;Kristie Huang, B˚

;2.1

(define (gcd a rem)
  (cond ((> rem a) (gcd rem a)))
  (if (= rem 0)
      a
      (gcd rem (remainder a rem))
      )
  )

(define (make-rat num den)
  (let ((divisor (gcd (abs num) (abs den))))
    (define (neg? x) (< x 0))
    (define (pos? x) (> x 0))
    (cond ((and (neg? ( / num divisor)) (neg? ( / den divisor)) ) (cons (/ (abs num) divisor) (/ (abs den) divisor)))
          ((and (pos? ( / num divisor)) (pos? ( / den divisor)) ) (cons (/ (abs num) divisor) (/ (abs den) divisor)))
          ;if both are neg or none of neg
          (else (cons (* (/ (abs num) divisor) -1) (/ (abs den) divisor)))
          ;if one is neg
          )

    )
  )


;2.2
(define (make-segment start-segment end-segment)
  (cons start-segment end-segment)
  )

(define (make-point x y)
  (cons x y)
  )
  
(define (start-segment line) (car line)) ;point where line starts
(define (end-segment line) (cdr line))
(define (x-point point) (car point)) ;xcoordinate of point
(define (y-point point) (cdr point))

;constructor puts stuff together
;selector returns info (getx gety etc)

(define (midpoint-segment line)

  (define pt1 (start-segment line))
  (define pt2 (end-segment line))
  (define 1x (x-point pt1))
  (define 1y (y-point pt1))
  (define 2x (x-point pt2))
  (define 2y (y-point pt2))
        
  (define midpoint-x (/ (+ 1x 2x) 2))
  (define midpoint-y (/ (+ 1y 2y) 2))
  (make-point midpoint-x midpoint-y)
  
  
  )

(define segment1 (make-segment (make-point 1 0) (make-point 0 1)))
(midpoint-segment segment1)
; returns (1/2, 1/2)

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))




;2.4

;; (car (cons 2 3)) ;; 2
;; (car z) -> (z 0)
;; ((cons 2 3) 0) ;; by definition of car
  
(define (cons x y)
  (lambda (m) (m x y)))
  

(define (car z)
  (z (lambda (p q) p)))
  
(define (cons x y)
  (lambda ((lambda (p q) p))) ((lambda (x y) x)))


;SUBSTITUTION
(car (cons x y))
((cons x y) (lambda (p q) p))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
((lambda (x y) x))
x

(define (cdr z)
  (z (lambda (p q) q)))


;2.7
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))


;2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))



;2.9
;  ((ub1 +ub2) - (lb1 + lb2)) / 2 
; width of total sum of intervals
                   
; (ub1 - lb1)/2  +  (ub2 - lb2)/2
; width of first interval        width of second interval
                   
; ==  (ub1 - lb1 + ub2 - 1b2) / 2
; == ((ub1 +ub2) - (lb1 + lb2) )/ 2



;width of (0 2) is 1
;width of (2 4) is 1
;width of (0 2) * (2 4)  is 4

;width of (3 5) is 1
;width of (2 4) is 1
;width of (3 5) * (2 4)  is 7

;even though starting widths are same, the resulting width is different
;therefore, you can't say based on widths what the resulting width is




; (2.6 optional)
