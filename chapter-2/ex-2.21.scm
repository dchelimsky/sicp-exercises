#lang scheme

(require rackunit)

;The procedure square-list takes a list of numbers as argument and returns a list of the squares of those numbers.
;
;(square-list (list 1 2 3 4))
;(1 4 9 16)
;
;Here are two different definitions of square-list. Complete both of them by filling in the missing expressions:
;
;(define (square-list items)
;  (if (null? items)
;      nil
;      (cons <??> <??>)))
;(define (square-list items)
;  (map <??> <??>))

(define (square x) (* x x))

(define (square-list-without-map items)
  (if (null? items)
      null
      (cons (square (car items)) (square-list-without-map (cdr items)))))

(define (square-list-with-map items)
  (map square items))

(define (run-examples square-list)
  (check-equal? (square-list (list 1 2 3)) (list 1 4 9))
  (check-equal? (square-list (list 1 2 3 4)) (list 1 4 9 16)))

(run-examples square-list-without-map)
(run-examples square-list-with-map)