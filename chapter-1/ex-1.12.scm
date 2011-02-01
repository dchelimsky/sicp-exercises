#lang scheme

(require rackunit)

;The following pattern of numbers is called Pascal's triangle.
;
;    1
;   1 1
;  1 2 1
; 1 3 3 1
;1 4 6 4 1
;
;The numbers at the edge of the triangle are all 1, and each number
;inside the triangle is the sum of the two numbers above it. Write a
;procedure that computes elements of Pascal's triangle by means of a
;recursive process.

(define (pascal-triangle row col)
  (cond
    ((or (<= row 2) (= col 1) (= row col)) 1)
    (else
      (+ (pascal-triangle (- row 1) (- col 1))
         (pascal-triangle (- row 1) col)))))

(check-eq? (pascal-triangle 1 1) 1)
(check-eq? (pascal-triangle 2 1) 1)
(check-eq? (pascal-triangle 2 2) 1)
(check-eq? (pascal-triangle 3 2) 2)
(check-eq? (pascal-triangle 5 3) 6)
(check-eq? (pascal-triangle 5 4) 4)
(check-eq? (pascal-triangle 5 5) 1)



