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


; 3.15



; 3.16


; 3.17
(define (cp pair)
  (let ((visited '()))
    (define (visited? pair vl)
      ; return #t if the pair is in vl, #f otherwise
      ; the member function is NOT useful for this because it does
      ;   not check to see if the pair being searched is the exact
      ;   same memory location as a pair in the list
      ; note that we need the second input to receive visited
      ;   so we can cdr through its contents
      ; #t is used as a placeholder for real code
      #t)
    (define (cp2 pair)
      ; if not a pair, 0
      ; if already visited, 0
      ; else:
          ; updated visited (use set!) to include pair
          ; set! is not a placeholder--it is real code!
          (set! visited (cons pair visited))
          ; recursive calls on car and cdr
      ; 0 is used as a placeholder for real code
      0)
    (cp2 pair)))

; 3.22
Here is the skeleton for a queue that uses message passing.

Note that you do not pass a queue as an input to a queue object. It is already a queue!

Peek is already written. Blanks do not imply that only one line of code is needed. They do imply that some amount of code is needed.

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))

    ; empty-queue? is written to align with the way front-ptr
    ; and rear-ptr were given, above
    (define (empty-queue?)
      ________)

    ; peek returns the datum at the front of the queue
    ; peek returns #f if the queue is empty
    (define (peek)
      (cond ((empty-queue?) (error "Empty queue.  :-("))
            (else (car front-ptr))))

    ; insert-queue! plays out differently depending on whether the queue
    ; is currently empty or not
    (define (insert-queue! datum)
      (let ((new-node (cons datum ())))
        ________))

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
                    ________
                    ; If there was only one thing in the queue, then the
                    ; rear-ptr will need to be set to nil
                    (if (null? front-ptr) ________)
                    ; Now return the element of the queue (or #f)
                    ________))))

    (define (dispatch message)
      (cond ((eq? message 'insert-queue!) insert-queue!)
            ((eq? message 'delete-queue!) delete-queue!)
            ((eq? message 'peek) peek)
            ((eq? message 'empty?) empty-queue?)))
    ________))





; delete! problem for tables
(define (make-table)
  (cons '* ()))
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
(define (assoc key records)
  (cond ((null? records) #f)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (rlookup k t)
  (let ((record (rassoc k (cdr t))))
    (cond (record (car record))
          (else #f))))
(define (rassoc value records)
  (cond ((null? records) #f)
        ((equal? value (cdar records)) (car records))
        (else (rassoc value (cdr records)))))

(define (delete! k t)
  ???)

; 3.25


; 3.27