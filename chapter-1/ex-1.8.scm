#lang scheme

; IN PROGRESS
;
; exercise 1.8
;
; Newton's method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value:
;
; (x/y^2 + 2y) / 3
;
; Use this formula to implement a cube-root procedure analogous to the square-root procedure.

(require rackunit)

(define (cube-root x) 2)

(check-eq? 2 (cube-root 8))