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

;;;;;;;;;;;;;;
; Background
;
; The p function itself results in an infinite loop.

;;;;;;;;;;;;;;
; Normal Order
;
; result: 0
;
; this
(test 0 (p))
; becomes this
(if (= 0 0) 0 (p))
; which returns 0 before (p) is ever eval'd

;;;;;;;;;;;;;;
; Applicative Order
;
; result: infinite loop
;
; this
(test 0 (p))
; becomes this
(test 0 (p))
; etc, because (p) expands to (p), which must then be expanded (to (p)), etc