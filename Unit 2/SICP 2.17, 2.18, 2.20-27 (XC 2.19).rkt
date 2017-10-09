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
(define (last-pair list)
  (if (null? (cdr list))
    (last-pair (cdr list))
    )
  )
