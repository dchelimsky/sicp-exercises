#lang scheme

(provide expect)

(define (expect outcome example)
  (cond
    ((eq? outcome example) (write '\.))
    (else
      (write 'F))))