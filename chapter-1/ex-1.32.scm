#lang scheme

(require rackunit)

;a. Show that sum and product (exercise 1.31) are both special cases of a still more general notion called accumulate that combines a collection of terms, using some general accumulation function:
;
;(accumulate combiner null-value term a next b)
;
;Accumulate takes as arguments the same term and range specifications as sum and product, together with a combiner procedure (of two arguments) that specifies how the current term is to be combined with the accumulation of the preceding terms and a null-value that specifies what base value to use when the terms run out. Write accumulate and show how sum and product can both be defined as simple calls to accumulate.
;

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (square n) (* n n))
(define (identity n) n)
(define (inc n) (+ n 1))

(define (sum-of-squares n)
  (sum square 0 inc n))

(check-eq? 30 (sum-of-squares 4))

(define (factorial n)
  (product identity 1 inc n))

(check-eq? 3628800 (factorial 10))

;b. If your accumulate procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

; the one I wrote was iterative, so here is the recursive version

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b) null-value
      (combiner (term a)
                (accumulate-rec combiner null-value term (next a) next b))))

(define (sum-rec term a next b)
  (accumulate-rec + 0 term a next b))

(define (product-rec term a next b)
  (accumulate-rec * 1 term a next b))

(define (sum-of-squares-rec n)
  (sum-rec square 0 inc n))

(check-eq? 30 (sum-of-squares-rec 4))

(define (factorial-rec n)
  (product-rec identity 1 inc n))

(check-eq? 3628800 (factorial-rec 10))
