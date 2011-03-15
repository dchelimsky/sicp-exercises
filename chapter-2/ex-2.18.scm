#lang scheme

(require rackunit)
(require "ex-2.17.scm")

; Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:

(check-equal? (reverse (list 1 4 9 16 25)) (list 25 16 9 4 1))
