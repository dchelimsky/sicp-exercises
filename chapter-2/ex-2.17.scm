#lang scheme

(require rackunit)
(provide last-pair)

; Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:
; eg
; (last-pair (list 23 72 149 34))
; (34)

(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))
 
(check-equal? (last-pair (list 23 72 149 34)) (list 34))
(check-equal? (last-pair (list 72 149 34))    (list 34))
(check-equal? (last-pair (list 149 34))       (list 34))
(check-equal? (last-pair (list 34))           (list 34))
