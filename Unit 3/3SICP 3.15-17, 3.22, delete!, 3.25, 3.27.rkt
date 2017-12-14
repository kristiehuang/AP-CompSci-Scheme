;3.15, 3.16, 3.17, 3.22, the delete! problem for tables, 3.25, 3.27
;Kristie Huang, B˚


; PROVE APPEND MAKES A COPY OF A AND USES ORIGINAL B

;before
(define a '(1 2 3))
(define b '(1 2 3))
a
b
(define appendable (append a b))
(set-car! (cdr a) 'new)
(set-car! b 'original)
;after
a
b
appendable


; 3.15 - did on paper

; 3.16
(define test '((cons 1 2 32 3) (cons (cons 1 2) 2) (cons 3 3)))
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(count-pairs test)

(define a (list 1 2 3))

a
(count-pairs a) ; returns 3

a
(set-car! (cdr a) (cddr a))
(count-pairs a) ; returns 4

a
(set-car! a (cdr a))
(count-pairs a) ; returns 7

a
(set-car! (cdr a) a)
; (count-pairs a) ;   never returns!!


; 3.17
(define (cp pair)
  (let ((visited '()))
    (define (visited? pair vl)
      (cond
        ((null? vl) #f)
        ((eq? pair (car vl)) #t)
        (else (begin (visited? pair (cdr vl)) #f)))
      ; return #t if the pair is in vl, #f otherwise
      ; check to see if the pair being searched is the exact
      ;   same memory location as a pair in the list
      ; note that we need the second input to receive visited
      ;   so we can cdr through its contents

      )
    (define (cp2 pair)
      (cond
        ((not (pair? pair)) 0) ;if not a pair
        ((visited? pair visited) 0) ;if already visited
        (else  ; updated visited (use set!) to include pair
               ; recursive calls on car and cdr
               (begin (set! visited (cons pair visited))
                     (+ 1 (cp (car pair)) (cp (cdr pair)))

                     )
               ))
      )
    (cp2 pair))
  )




; 3.22

;Here is the skeleton for a queue that uses message passing.
;Note that you do not pass a queue as an input to a queue object. It is already a queue!
;Peek is already written. Blanks do not imply that only one line of code is needed. They do imply that some amount of code is needed.

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    ; empty-queue? is written to align with the way front-ptr
    ; and rear-ptr were given, above
    (define (empty-queue?)
      (null? front-ptr))

    ; peek returns the datum at the front of the queue
    ; peek returns #f if the queue is empty
    (define (peek)
      (cond ((empty-queue?) 'nope)
            (else (car front-ptr))))

    ; insert-queue! plays out differently depending on whether the queue
    ; is currently empty or not
    (define (insert-queue! datum)
      (let ((new-node (cons datum '())))
        (cond ((empty-queue?) (begin
                                (set! front-ptr new-node) (set! rear-ptr new-node)))
              (else (set-cdr! rear-ptr new-node) (set! rear-ptr new-node)))
     
        ))

    ; delete-queue! has three possibilties:
    ; * empty queue
    ; * one element in queue
    ; * more than one element in queue
    (define (delete-queue!)
      (cond ((empty-queue?) (error "Empty queue.  :-("))
            (else 
             ; store the datum at the head of the queue
             (let ((return-value (peek)))
               ; update the front pointer
               (set! front-ptr (cdr front-ptr))
               ; If there was only one thing in the queue, then the
               ; rear-ptr will need to be set to nil
               (if (null? front-ptr) (set! rear-ptr null))
               ; Now return the element of the queue (or #f)
               (if (null? return-value) #f return-value)
             ))))

    (define (dispatch message)
      (cond ((eq? message 'insert-queue!) insert-queue!)
            ((eq? message 'delete-queue!) delete-queue!)
            ((eq? message 'peek) peek)
            ((eq? message 'empty?) empty-queue?)))
    
    dispatch))


(define q1 (make-queue))
((q1 'empty?)) ;#t
((q1 'insert-queue!) 'a)
((q1 'insert-queue!) 'b)
((q1 'insert-queue!) 'c)
((q1 'peek)) ;a b c, returns a
((q1 'empty?))
((q1 'delete-queue!))
((q1 'peek)) ;a bc, returns b




; delete! problem for tables

(define (make-table)
  (cons '* '()))
(define (empty-table? t) (null? (cdr t)))

(define (insert! key value table)
  (let ((record (assoc key (cdr table))))
    (if record
        (set-cdr! record value)
        (set-cdr! table
                  (cons (cons key value) (cdr table)))))
  'ok)

        
(define (lookup k t)
  (let ((record (assoc k (cdr t))))
    (cond (record (cdr record))
          (else #f))))
(define (association key records) ;returns pair based on key
  (cond ((null? records) #f)
        ((equal? key (caar records)) (car records))
        (else (association key (cdr records)))))

(define (rlookup k t)
  (let ((record (rassoc k (cdr t))))
    (cond (record (car record))
          (else #f))))
(define (rassoc value records) ;returns pair based on value
  (cond ((null? records) #f)
        ((equal? value (cdar records)) (car records))
        (else (rassoc value (cdr records)))))

(define (delete! k t)
  (let ((rest-of-t (cdr t)))
    (if (eq? (caar rest-of-t) k) (set-cdr! t (cdr rest-of-t))
      (delete! k (cdr t)))))

(define t1 (make-table))
(insert! 'a 1 t1)
t1
t1

(define t2 (make-table))
(insert! 'hello 'a t2)
(insert! t2 4 t1)

; 3.25

(define a (list 1 2))
(define b (cons a a))
(set-car! a 3)
b


; 3.27