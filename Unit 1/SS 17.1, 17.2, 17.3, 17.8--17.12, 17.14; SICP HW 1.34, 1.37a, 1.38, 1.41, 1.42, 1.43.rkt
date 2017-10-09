;Kristie Huang, B˚
;SS 17.1, 17.2, 17.3, 17.8--17.12, 17.14
;SICP HW 1.34, 1.37a, 1.38, 1.41, 1.42, 1.43

; SS 17.1

(car '(Rod Chris Colin Hugh Paul)) ;'Rod

(cadr '(Rod Chris Colin Hugh Paul)); 'Chris

(cdr '(Rod Chris Colin Hugh Paul)) ;'(Chris Colin Hugh Paul)

;(car 'Rod) ;ERROR, can't choose first element of a word

(cons '(Rod Argent) '(Chris White)) ; '((Rod Argent) Chris White)

(append '(Rod Argent) '(Chris White)) ;(Rod Argent Chris White)

(list '(Rod Argent) '(Chris White)) ;'((Rod Argent) (Chris White))

(caadr '((Rod Argent) (Chris White)
                      (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
;car car cdr
;Chris

(assoc 'Colin '((Rod Argent) (Chris White)
                             (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
;(Colin Blunstone)

(assoc 'Argent '((Rod Argent) (Chris White)
                              (Colin Blunstone) (Hugh Grundy) (Paul Atkinson)))
;(Rod Argent)




; SS 17.2
(define (bcd a b) (append (cdr a) (car b)))
(bcd '(a b c) '(d e f))
;((B C D))

(define (bce a b) (cons (cdr a) (list-ref b 1)))
(bce '(a b c) '(d e f))
;((B C) E)

(define (abcabc a b) (append a a))
(abcabc '(a b c) '(d e f))
;(A B C A B C)

(define (adbcef a b) (list (se (car a) (car b)) (se (cdr a)(cdr b))))
(adbcef '(a b c) '(d e f))
;((A D) (B C E F))


; SS 17.3
(map (lambda (x) (lambda (y) (+ x y))) '(1 2 3 4))
;ERROR; needs 2 arguments



; SS 17.8 // write member
(define (member element list)
  (cond ((null? list) #f)
        ((equal? element (car list)) #t)
        (else (member element (cdr list))))
  )




; SS 17.9 // write list-ref
;(listref '(hi there hello) 2)   'hello
(define (listref list index)
  (if (= index 1) (car list)
      (listref (cdr list) (- index 1))
      )
  )

; just for fun –  returns index of element in list
(define (index element list)
  (define (indexhelper element list counter)
    (cond ((equal? element (car list)) counter)
          ((indexhelper element (cdr list) (+ 1 counter)))
          ))
  (if (null? list) '(empty list sry)
      (indexhelper element list 0)
      )
  )




; SS 17.10
(define (length2 list)
  (define (lengthhelper list length)
    (cond ((null? list) (+ 1 length))
          ((lengthhelper (cdr list) (+ length 1)))))
  (if (null? list) 0
      (lengthhelper (cdr list) 0)
      )
  )


; SS 17.11
(define (before-in-list? list first second)
  (define (beforelisthelper list first second)
    (cond 
      ((equal? (car list) second) #f) ;if second comes first; break return false
      ((equal? (car list) first) #t) ;if first comes first; break return true
      (beforelisthelper (cdr list) first second) ;if none, repeat until one comes first
      )
    )
  (cond ((< (count list) 2) #f)
        ;((= (assoc list '((first second))) #f) #f) ;if they are not even in list, return false
        (beforelisthelper list first second)
        )
  )


(define (before-in-list?1 list first second)
  (cond ((< (count list) 2) #f)
        ;((= (assoc list '((first second))) #f) #f) ;if they are not even in list, return false
        ((equal? (car list) second) #f) ;if second comes first; break return false
        ((equal? (car list) first) #t) ;if first comes first; break return true
        (before-in-list?1 (cdr list) first second) ;if none, repeat until one comes first
        )
  )
  
  

; SS 17.12
(define (flatten listt)
  (cond ((null? listt) '())
        ((list? (car listt)) (append (flatten (car listt)) (flatten (cdr listt))))
        (else (cons (car listt) (flatten (cdr listt))))
        )
  )
;map list; append
  


; SS 17.14
;;;this is broken
(define (branch index list)
  (cond
    ((null? (cdr index)) (listref list (car index)))
    (else (branch (cdr index) (listref list (car index))))
    )
  )



; SICP 1.34
(define (square x) (* x x))

(define (f g) (g 2))
;ERROR; can't call function on function with no base case


; SICP 1.37a
(define (golden-ratio k)
  (if (= k 0) 0
      (/ 1.0 (+ 1.0 (golden-ratio (- k 1))))
      )
  )

(define (cont-frac num den k)
  (if (= k 0) 0
      (/ (num k) (+ (den k) (cont-frac num den (- k 1))))
      )
  )



; SICP 1.38
(define (euler k)
  (if (= k 0) 2
      (+ (cont-frac (lambda (i) 1.0) (lambda (x) (if (= (remainder (+ x 1) 3) 0) (* (/ (+ x 1) 3) 2)
                                                     1)) k) 2))
  )
   


; SICP 1.41
(define (inc x) (+ 1 x))

(define (double procedure)
  (lambda (x) (procedure (procedure x)))
  )

;(((double (double double)) inc) 5)
;((sixteentuple inc) 5) = 21


; SICP 1.42
(define (compose proc1 proc2)
  (lambda (x) (proc1 (proc2 x)))
  )

; SICP 1.43
(define (repeated procedure num)
  (if (= num 1) procedure
      (compose (repeated procedure (- num 1)) procedure)
      )
  )
