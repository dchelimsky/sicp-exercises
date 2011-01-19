#lang scheme

;expectation framework ?!?!

(define (expect outcome example)
  (cond
    ((eq? outcome example) (write '\.))
    (else
      (write 'F))))

(define (square x) (* x x))

(expect 4 (square 2))
(expect 1 (square 1))
