#lang scheme

(require rackunit)

;Suppose we define the procedure
;
(define (f g)
  (g 2))
;
;Then we have
(define (square n) (* n n))
(check-eq?
 (f square)
 4)

(check-eq?
 (f (lambda (z) (* z (+ z 1))))
 6)

;What happens if we (perversely) ask the interpreter to evaluate the combination (f f)? Explain.

(f f)
(f 2)
(2 2)
