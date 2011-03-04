#lang scheme

(require rackunit)

;function f is defined by the rule that:
;
;  f(n) = n if n < 3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
;  
;Write a procedure that computes f by means of a recursive process.

(define (f n)
  (if (< n 3) n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

;Write a procedure that computes f by means of an iterative process.

(define (g n) 
  (define (iter a b c count) 
    (if (= count 0) 
        a 
        (iter b c (+ c (* 2 b) (* 3 a)) (- count 1)))) 
  (iter 0 1 2 n)) 

; ^^ PLACEHOLDER ^^

(check-eq? (f 1) (g 1))
(check-eq? (f 2) (g 2))
(check-eq? (f 3) (g 3))
(check-eq? (f 4) (g 4))
(check-eq? (f 5) (g 5))
(check-eq? (f 6) (g 6))
