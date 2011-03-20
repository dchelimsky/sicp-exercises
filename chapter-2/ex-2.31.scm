#lang scheme

(require rackunit)

; Abstract your answer to exercise 2.30 to produce a procedure tree-map with the property that square-tree could be defined as

; (define (square-tree tree) (tree-map square tree))

(define (square x) (* x x))

(define (tree-map p t)
    (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map p sub-tree)
             (p sub-tree)))
       t))

(define (square-tree tree) (tree-map square tree))

(check-equal?
 (square-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
 (list 1 (list 4 (list 9 16) 25) (list 36 49)))


