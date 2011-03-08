#lang scheme

(require rackunit)

;You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure.

(define (filtered-accumulate combiner null-value term a next b filter) 
  (cond ((> a b) null-value)
        ((filter a) 
         (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else
         (combiner null-value (filtered-accumulate combiner null-value term (next a) next b filter)))))

(define (sum term a next b)
  (define (filter n) n)
  (filtered-accumulate + 0 term a next b filter))

(define (identity n) n)
(define (inc n) (+ 1 n))

(check-eq? 55 (sum identity 1 inc 10))

; Show how to express the following using filtered-accumulate:

;a. the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (square n) (* n n))

(define (sum-of-squares-of-primes-up-to n)
  (filtered-accumulate + 0 square 1 inc n prime?))

(check-eq?   1 (sum-of-squares-of-primes-up-to 1))
(check-eq?   5 (sum-of-squares-of-primes-up-to 2))
(check-eq?  14 (sum-of-squares-of-primes-up-to 3))
(check-eq?  14 (sum-of-squares-of-primes-up-to 4))
(check-eq?  39 (sum-of-squares-of-primes-up-to 5))

;b. the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i < n such that GCD(i,n) = 1).
