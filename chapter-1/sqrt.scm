#lang scheme

(require "./assorted_functions.scm")

(provide improve good-enough?)

(define (sqrt target)
  (sqrt-iter 1.0 target))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(sqrt 1)
(sqrt 4)
(sqrt 9)
(sqrt 16)