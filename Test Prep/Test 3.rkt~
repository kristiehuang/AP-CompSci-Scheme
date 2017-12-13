(define (apply-directives pair directives)
(if
(null? directives) pair
(let ((directive (if (eq? (car directives) 'a) car cdr)))
  (apply-directives (directive pair) (cdr directives)))
)
)

(define x '(A (B C) D E))


(define (set-cxr! pair value list-of-directives)

  (let ((mutate-pair! (if (eq? (car directives) 'a) set-car! set-cdr!)))
  
    (mutate-pair!  (apply-directives pair (cdr directives))  value)))



(define (paycashier! shoppingQueue)

  (let ((payer (peek shoppingQueue)))    ; who is in the front of the queue?

    (cond (((payer 'oktopay?))     ; will we let them pay?
             ((payer 'get-out-of-jail))        ; stats teacher no longer penalized
             (display (cons ((delete-queue! shoppingQueue) 'name) '(has paid)))
             (newline)) 
         
          (else   ; a stats teacher who needs to be penalized!

             ((payer 'discriminate))      ; penalize person for being a stats teacher
             (display (cons (payer 'name) '(has gone to the back of the line)))
             (newline)

             ; Actually put the stats teacher in the back of the queue

             (insert-queue! (delete-queue! shoppingQueue) shoppingQueue)))))


(define (hello x)
  (cond ((hi?sk s) asdfa)
        ((asdfa) (asdf))
        )
  )