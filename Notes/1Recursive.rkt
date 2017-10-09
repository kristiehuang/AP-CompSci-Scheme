(define (downup1 wd)
  (se wd))

(define (downup2 wd)
  (se wd (first wd) wd)
  )

(define (downup3 wd)
  (se wd
      (bl wd)
      (first wd)
      (bl wd)
      wd))


(define (explode word)
  (if (= (count word) 1) (se word)
      (se (first word) (explode (bf word)))

      )
  )

;hithere
;h ithere->i >there

;hithere
;hi it th he er re

(define (firsttwo word)
  (se (first word)(first (bf word)))
  )

(define (letter-pairs word)
  (if (= (count word) 1) (se word)
      (se
       (firsttwo word)
       (letter-pairs (bf word)))
      )
  )

;order of growth / big O notation
;time
;recursion is usually logarithmic
;
