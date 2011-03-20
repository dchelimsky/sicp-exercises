#lang scheme

(require rackunit)

;Define a procedure square-tree analogous to the square-list procedure of exercise 2.21. That is, square-tree should behave as follows:
;
;(square-tree
; (list 1
;       (list 2 (list 3 4) 5)
;       (list 6 7)))
;(1 (4 (9 16) 25) (36 49))
;
;Define square-tree both directly (i.e., without using any higher-order procedures) and also by using map and recursion.

(define (square x) (* x x))

(define (square-tree-without-map tree)
  (cond ((null? tree) null)
        ((list? (car tree))
         (cons (square-tree-without-map (car tree)) (square-tree-without-map (cdr tree))))
        (else
         (cons (square (car tree)) (square-tree-without-map (cdr tree))))))

(define (square-tree-with-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-with-map sub-tree)
             (square sub-tree)))
       tree))

(define (run-examples square-tree)
  (check-equal?
   (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
   (list 1 (list 4 (list 9 16) 25) (list 36 49))))

(run-examples square-tree-without-map)
(run-examples square-tree-with-map)

