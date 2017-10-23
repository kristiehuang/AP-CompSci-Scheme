;Kristie Huang
;B˚ / AP CS

;2.17
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))


(define (last-pair list)
  (if (= 1 (length list)) list
      (last-pair (cdr list))
     
      )
  )

; v2.0
(define (last-pair2 list)
  (if (null? (cdr list))
      (last-pair2 (cdr list))
      '()
      )
  )

;2.18
(define (reverse l)
  (define (reverse-iter list remaining)
    (if (null? list) remaining
        (reverse-iter (cdr list) (cons (car list) remaining))
        ))
  (reverse-iter l '())
  )

(define (reverse2.0 l)
  (cond ((null? l) '())
        ((null? (cdr l)) l)
        (else (append (reverse2.0 (cdr l)) (list (car l))))
        )
  )


;2.20
(define (same-parity a . z)
  
  ;if car list = even, filter list by even
  ;else, filter list by odd
  
  (if (even? a) (cons a (filter even? z))
      (cons a (filter odd? z)))
  )


;2.21
(define (square x) (* x x))

(define (square-list list)
  (map square list)
  )

(define (square-list2 list)
  (if (null? list)
      '()
      (cons (square (car list)) (square-list2 (cdr list)))))

;2.22

;Louis Reasoner has accidentally switched the way he uses cdr and car
;'(1 4 5 2)
;(cons (square-list (4 5 2)) 1 --> (square-list (5 2)     (16 1)
;he is working in reverse order, so therefore it returns the list backwards


;2.23
;map acts on each of the elements in the list to return a modified variable, these variables are conned into a list that can be used again
;for-each acts on each of the elements in the list to return a modified variable; these variables are used to perform an action


;2.24

'(1 (2 (3 4)))

;( 1 -> ) ( 2 -> ) (.. / )
;                   > (3 ->) (4 /)

;(list      1     (list 2 (list 3 4))    )
;                   > (list  2   (list 3 4)  )
;                                 > (3   4)



;2.25
(define a
  '(1 3 (5 7) 9) )
(cadr (cadr (cdr a)))

(define b
  '((7)) )
(caar b)

(define c
  '(1 (2 (3 (4 (5 (6 7))))))  )
(cadr (cadr (cadr (cadr (cadr (cadr c))))))



;2.26
(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y) ; (1 2 3 4 5 6)

(cons x y) ; ( (1 2 3) 4 5 6)
;;????

(list x y) ; ( (1 2 3) (4 5 6))


;2.27

(define (deep-reverse l)
  (define (reverse-iter list final)
    (cond ((null? list) final)
          ;if car list is list, run thru w/ list
          ((list? (car list)) (reverse-iter (cdr list) (append (deep-reverse (cdr l)) (list (reverse (car l)) ))))
          (else (reverse-iter (cdr list) (cons (car list) final)))
          )
    )
  (reverse-iter l '())
  
  )



;2.19 (extra credit)