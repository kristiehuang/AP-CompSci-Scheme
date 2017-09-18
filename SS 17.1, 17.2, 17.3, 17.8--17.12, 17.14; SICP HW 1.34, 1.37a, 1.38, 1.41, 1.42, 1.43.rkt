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
  (if (= index 0) (car list)
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
  (
   )

; SS 17.11
; SS 17.12
; SS 17.14


