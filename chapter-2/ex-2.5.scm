#lang scheme

(require rackunit)
(provide cons car cdr)

; Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair a and b as the integer that is the product 2^a 3^b. Give the corresponding definitions of the procedures cons, car, and cdr.

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

;; borrowed (and tweaked) from http://community.schemewiki.org/?sicp-ex-2.5
(define (count-even-divisions pair-val divisor) 
  (define (iter next-exponent)
    (let ((divides-evenly? (lambda () (eq? 0 (remainder pair-val (expt divisor next-exponent))))))
      (if (divides-evenly?) (iter (+ next-exponent 1))
          (- next-exponent 1))))
  (iter 1))

(define (car z) (count-even-divisions z 2)) 
(define (cdr z) (count-even-divisions z 3)) 

(check-equal? (car (cons 2 2)) 2)
(check-equal? (car (cons 2 3)) 2)
(check-equal? (car (cons 2 4)) 2)

(check-equal? (cdr (cons 2 2)) 2)
(check-equal? (cdr (cons 2 3)) 3)
(check-equal? (cdr (cons 2 4)) 4)