#lang scheme

(require "../expectations.scm")

; in flight - pay no attention!!!!!!!!
(define (sum-of-squares-of-top-2 a b c) 2)

(expect 2 (sum-of-squares-of-top-2 1 1 1))
