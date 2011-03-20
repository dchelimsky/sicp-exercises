#lang scheme

(require rackunit)

(provide fringe)

; Write a procedure fringe that takes as argument a tree (represented as a list) and returns a list whose elements are all the leaves of the tree arranged in left-to-right order. For example,

(define x (list (list 1 2) (list 3 4)))

(define (fringe x)
  (cond ((null? x) null)
        (else
         (append
          (if (pair? (car x)) (fringe (car x)) (list (car x)))
          (fringe (cdr x))))))

(check-equal? (fringe x) (list 1 2 3 4))

(check-equal? (fringe (list x x)) (list 1 2 3 4 1 2 3 4))
