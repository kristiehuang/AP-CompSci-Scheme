(define my-name '(unknown))
(set! my-name '(Kristie))

;my-name = Kristie

(not #t) ;#f

;printing
(display '(hello this is a print statement))

;primitive expression = cannot be broken down further

;procedure > function


;assignment operator
;in Java:  =
;in Scheme: set!

;applicative-order - fully-define/eval all parameters before running body of func
;normal-order - eval/define only when parameter called
	;- used in some special forms (if)

(define p 23) ;define variable
(define (p) (parameters)) ;define function


;recursive (+ (f) (f))
; cant be written as loop
; has to wait for both fs to finish running before adding. takes along time
; expands and contracts
; do not keep track of parameters

;iterative
; can be written as loop
; faster, less memory
; will always return same value no matter where in the loop u are
; keep track of state of proces at all times

;tail recursive = could have been written as a loop = iterative

;order of growth
; input size vs number of iterations
factorial - 5! vs 4!, has +1 interation - linear      ;if input is n. calls itself n times.
/2 - 8 vs 16, has +1 iteration .. 1024 vs 2048, +1 iteration - logarithmic
;if input is n. calls itself log(2)n times


; linear > exponential order of growth!!!! much faster
; coefficient of lead term does not matter

;order of growth = how many times the func is being called
;recursive/iterative diff
;O(1) constant for linear iterative
;O(n) linear recursive

;   (trace func) ;shows all lines of intermediary code

;(if expr #t #f)
; if expr is true, return #t. if not, return #f

;WORDS
(butfirst 'hello) ;'ello
(count 'blahblahblah) ;12
(word 'hello 'this 'is) ;'hellothisis

;SENTENCES
(sentence '(i get) 'home 'at 3 'pm) ;'(i get home at 3pm)  ;; no need for '3! just 3 is fine
(se '(when i get) 'home) ;'(when i get home)
(butfirst '(yer blues)) ;'(blues)
(butlast '(hello there)) ;hello
(every butlast '(hello there)) ;hell there    functions as data!!

> (bf '(sexy sadie)) ;(sadie) - sentence form!
> (first (bf '(sexy sadie))) ;sadie - word form!

(item 3 '(hello there my name is kristie)) ;returns "my"

;PREDICATE = function that returns a bool value
(equal? 'hi 'hello) ;#f
(= 23 23) ;= is for numbers only

;(member? letter wd)

;vowel?
(define (vowel? wd) (member? wd 'aeiou))

;even? odd? number? empty?




;if vs cond
(define (cond2.0 x) 
  (cond ((= x 1) 'hello)
        ((= x 2) 'ya)
        ('(ya hello)))
  )
; can take more than 1 parameter

(define (if2.0 x) 
  (if (= x 1) 'hello
      '(ya hello))
  )
; must take an if and else