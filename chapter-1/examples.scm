#lang scheme

(require "../expectations.scm")

(define (square x) (* x x))

(expect 4 (square 2))
(expect 1 (square 1))

