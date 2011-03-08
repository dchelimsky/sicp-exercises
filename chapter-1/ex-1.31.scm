#lang scheme

; a.  The sum procedure is only the simplest of a vast number of similar abstractions that can be captured as higher-order procedures.51 Write an analogous procedure called product that returns the product of the values of a function at points over a given range. Show how to define factorial in terms of product. Also use product to compute approximations to  using the formula:
; b.  If your product procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process.

(define (identity n) n)
(define (inc n) (+ n 1))

; iterative
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (* result (term a)))))
  (iter a 1))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

; recursive
(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))

(define (factorial-rec n)
  (product-iter identity 1 inc n))

; examples
(factorial-iter 5)
(factorial-rec 5)

; approx pi
; Here's what I came up with first - i saw the pattern in groups of two. Leaving this
; here as a reminder :)
(define (approx-pi limit)
  (define (add-two n) (+ n 2))
  (define (x-term n)
    (* n (+ 2 n)))
  (define (x)
    (product-iter x-term 2 add-two limit))
  (define (y-term n)
    (* n n))
  (define (y)
    (product-iter y-term 3 add-two (+ 1 limit)))
  (* 4 (/ (x) (y))))

; here's a much simpler version with the pattern expressed in groups of one
(define (approx-pi-with-term n)
  (define (pi-term n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2))))
  (* 4 (product-iter pi-term 1 inc n)))

(approx-pi 10)
(approx-pi-with-term 10)

(approx-pi 11)
(approx-pi-with-term 11)

(approx-pi 100)
(approx-pi-with-term 100)

(approx-pi 1000)
(approx-pi-with-term 1000)
