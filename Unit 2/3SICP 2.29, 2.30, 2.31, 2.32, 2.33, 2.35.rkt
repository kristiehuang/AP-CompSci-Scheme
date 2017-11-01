;Kristie Huang, B˚


(define make-mobile list)


(define make-branch list)
(define len car)
(define struct cadr)

(define weight? number?)
(define mobile? pair?)

; Here is a test mobile so we can have a sample input to the
; programs, below.  Note that we must adhere to the abstractions.

(define m
  (make-mobile
   (make-branch 6
                (make-mobile
                 (make-branch 1 8)
                 (make-branch 4 2)))
   (make-branch 5 12)))

;2.29 a
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))

(define (branch-length branch) (car branch))
(define (branch-struct branch) (cadr branch))


;2.29 b
(define (total-weight mob)
  (define (weight branch)
    (cond
      ((weight? branch) branch)
      ((mobile? branch) (total-weight branch))
      )
    )

  (+ (weight (branch-struct (left-branch mob))) (weight (branch-struct (right-branch mob))))
  )


;2.29 c
(define (balanced? mob)

  (define (torque branch)
    (if 
     (weight? (branch-struct branch)) (* (branch-length branch) (branch-struct branch))  
     (* (branch-length branch) (total-weight (branch-struct branch)))
     ))
  
  (define (branch-balanced? branch)
    (cond
      ((weight? branch) #t)
      ((mobile? branch) (balanced? branch))
      ))
    
  (and (= (torque (left-branch mob)) (torque (right-branch mob))) (branch-balanced? (branch-struct (left-branch mob))) (branch-balanced? (branch-struct (right-branch mob))))
  
  )

(trace balanced?)
(trace total-weight)



;2.29 d
;if using cons instead of list, use cadr instead of cadr to get the last value in the list.



;2.30
(define (square x) (* x x))


(define (sq-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (sq-tree (car tree))
                    (sq-tree (cdr tree))))
        )
  )


;2.31

(define (tree-map func tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (func tree))
        (else (cons (tree-map func (car tree))
                    (tree-map func (cdr tree))))
        )
  )
(define (square-tree tree) (tree-map square tree))


;2.32
(define (subsets s)
  (if (null? s) (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)   )
        )
      )
  )
        


;2.33
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (map2 p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence)
  )

(define (append2 seq1 seq2)
  (accumulate cons '() (cons seq1 seq2)))

(define (length2 sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))  ;;why does this work


;2.35 broken
(define (count-leaves x)
  (cond ((null? x) 0)  
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define asdf (cons (list 1 2) (list 3 4)))

(define (count-leaves2 t)
  (accumulate + 0 (map (lambda (x y) (+ x y)) t))
  ) ;if t is not pair; 1;







(define (maxpath1 tree)
  (cond
    ((null? tree) 0)
    ;((leaf? tree) tree)
    (else (+ (datum tree) (max (maxpath1 (right tree)) (maxpath1 (left tree)))))))