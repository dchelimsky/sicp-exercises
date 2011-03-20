#lang scheme

(require rackunit)

;Modify your reverse procedure of exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well. For example,
;
;(define x (list (list 1 2) (list 3 4)))
;
;x
;((1 2) (3 4))
;
;(reverse x)
;((3 4) (1 2))
;
;(deep-reverse x)
;((4 3) (2 1))

(define (deep-reverse l)
  (define (iter old new)
    (if (null? old)
        new
        (iter (cdr old)
              (cond
                ((pair? (car old))
                 (cons (deep-reverse (car old)) new))
                (else (cons (car old) new))))))
  (iter l null))

(define the-list (list (list 1 2) (list 3 4)))

(check-equal? (reverse the-list) (list (list 3 4) (list 1 2))) 

(check-equal? (deep-reverse the-list) (list (list 4 3) (list 2 1)))

(check-equal?
 (deep-reverse (list 1 (list 2 (list 3 4))))
  (list (list (list 4 3) 2) 1))