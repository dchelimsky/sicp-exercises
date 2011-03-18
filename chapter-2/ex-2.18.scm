#lang scheme

; Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:

(require rackunit)

;;;;;;;;;;;;;;;;;;;;;;
(define (all-but-last l)
  (if (null? (cdr l))
      null
      (cons (car l) (all-but-last (cdr l)))))

(check-equal? (list 1 2 3) (all-but-last (list 1 2 3 4)))

(define (reverse-using-all-but-last l)
  (if (null? (cdr l))
      (list (car l))
      (cons (last l) (reverse-using-all-but-last (all-but-last l)))))

;;;;;;;;;;;;;;;;;;;;;;
(define (reverse-iter l)
  (define (iter old new)
    (if (null? old) new
        (iter (cdr old) (cons (car old) new))))
  (iter l null))

;;;;;;;;;;;;;;;;;;;;;;
(define (run-examples reverse)
  (check-equal? (reverse (list 1 4 9 16 25)) (list 25 16 9 4 1))
  (check-equal? (reverse (list 1)) (list 1)))

(run-examples reverse-using-all-but-last)
(run-examples reverse-iter)
