#lang scheme

(require rackunit)

; We can represent a set as a list of distinct elements, and we can represent the set of all subsets of the set as a list of lists. For example, if the set is (1 2 3), then the set of all subsets is (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3)). Complete the following definition of a procedure that generates the set of subsets of a set and give a clear explanation of why it works:

;(define (subsets s)
;  (if (null? s)
;      (list nil)
;      (let ((rest (subsets (cdr s))))
;        (append rest (map <??> rest)))))

(define (subsets s)
  (define (build-subsets item)
    (lambda (subset)
      (cons item subset)))
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest (map (build-subsets (car s)) rest)))))

(check-equal? (subsets (list 1 2 3))
              (list (list) (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)))

(check-equal? (subsets (list 2 3))
              (list (list) (list 3) (list 2) (list 2 3)))

(check-equal? (subsets (list 3))
              (list (list) (list 3)))

(check-equal? (subsets (list))
              (list (list)))

; To build a list of subsets, we cons the car onto each of the subsets of the rest.

;(subsets '(1 2 3)) => (map (cons 1 subset) (subsets '(2 3))) => (1 2 3), (1 2), (1 3), (1)
;(subsets '(2 3)) => (map (cons 2 subset) (subsets '(3))) => (2 3), (2)
;(subsets '(3)) => (map (cons 3) (subsets '())) => (3)
;(subsets '()) => (map (cons null) (subsets null)) => ()
         
                      

