#lang scheme

;Louis Reasoner tries to rewrite the first square-list procedure of exercise 2.21 so that it evolves an iterative process:
;
;(define (square-list items)
;  (define (iter things answer)
;    (if (null? things)
;        answer
;        (iter (cdr things) 
;              (cons (square (car things))
;                    answer))))
;  (iter items nil))
;
;Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?

;;;;;;;;;
; ANSWER
;
; This is the same function, essentially, as the reverse function in ex-2.18 (except this one squares the elements). It builds a list starting with the first element, but then consing the next element onto that (i.e. to the front of the new list).


;
;Louis then tries to fix his bug by interchanging the arguments to cons:
;
(define (square-list items)
  (define (square x) (* x x))
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items null))

(square-list (list 1 2 3))

;This doesn't work either. Explain.

;;;;;;;;;
; ANSWER
;
; This gets the squares in the right order, but they are in progressively nested lists, beginning with an empty list.