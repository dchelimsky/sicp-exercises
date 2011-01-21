#lang scheme

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; a-plus-abs-b checks to see if b is positive or negative.
; if positive, the inner function returns the + operator.
; if negative, the inner function returns the - operator, which has the same effect
; as taking the absolute value of the 2nd argument.