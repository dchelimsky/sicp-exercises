#lang scheme

(require "../expectations.scm")

;(define (sum-of-squares-of-top-2 a b c)
;  (cond
;    ((and (<= a b) (< a c)) (+ (* b b) (* c c)))
;    ((and (< b a) (< b c)) (+ (* a a) (* c c)))
;   (else
;     (+ (* a a) (* b b)))))

(define (square a) (* a a))

(define (sum-of-squares a b) (+ (square a) (square b)))

(define (sum-of-squares-of-top-2 a b c)
  (cond
    ((eq? a (min a b c)) (sum-of-squares b c))
    ((eq? b (min a b c)) (sum-of-squares a c))
    (else (sum-of-squares a b))))

; what I'd really like to write is something like this:
; (define (sum-of-squares-of-top-2 a b c)
;   (sum-of-squares (top-2 a b c)))
;
; but I'm not sure about list syntax just yet

(expect 2 (sum-of-squares-of-top-2 1 1 1))

; this next example forced the <= in the first line
(expect 5 (sum-of-squares-of-top-2 1 1 2))
(expect 5 (sum-of-squares-of-top-2 1 2 1))
(expect 5 (sum-of-squares-of-top-2 2 1 1))

(expect 8 (sum-of-squares-of-top-2 1 2 2))
(expect 8 (sum-of-squares-of-top-2 2 1 2))
(expect 8 (sum-of-squares-of-top-2 2 2 1))

(expect 13 (sum-of-squares-of-top-2 1 2 3))
(expect 13 (sum-of-squares-of-top-2 1 3 2))
(expect 13 (sum-of-squares-of-top-2 2 1 3))
(expect 13 (sum-of-squares-of-top-2 2 3 1))
(expect 13 (sum-of-squares-of-top-2 3 2 1))
(expect 13 (sum-of-squares-of-top-2 3 1 2))