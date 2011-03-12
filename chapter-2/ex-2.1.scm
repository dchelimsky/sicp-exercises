#lang scheme

(require rackunit)

; Define a better version of make-rat that handles both positive and negative arguments. Make-rat should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (make-rat n d)
  (let ((normalize (if (< d 0) - +)))
    (let ((divisor (normalize (gcd n d))))
      (cons (/ n divisor) (/ d divisor)))))

(let ((rat (make-rat 1 2)))
  (check-equal? 1 (numer rat))
  (check-equal? 2 (denom rat)))

(let ((rat (make-rat -1 -2)))
  (check-equal? 1 (numer rat))
  (check-equal? 2 (denom rat)))

(let ((rat (make-rat 1 -2)))
  (check-equal? -1 (numer rat))
  (check-equal? 2 (denom rat)))

(let ((rat (make-rat -1 2)))
  (check-equal? -1 (numer rat))
  (check-equal? 2 (denom rat)))

(let ((rat (make-rat 0 1)))
  (check-equal? 0 (numer rat))
  (check-equal? 1 (denom rat)))

(let ((rat (make-rat 0 -1)))
  (check-equal? 0 (numer rat))
  (check-equal? 1 (denom rat)))
