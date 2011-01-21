#lang scheme

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; describe what happens with the above with:
;  normal-order evaluation
;  applicative-order evaluation
;
; TODO