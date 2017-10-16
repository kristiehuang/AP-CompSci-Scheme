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
    (if (= 0 (length list)) remaining
        (reverse-iter (cdr list) (cons (car list) remaining))
        )
    )
  (reverse-iter l '())
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
;2.25
;2.26
;2.27

;2.19 (extra credit)