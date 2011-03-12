#lang scheme

(require rackunit)
(require "ex-2.2.scm")

; Exercise: implement a representation for rectangles in a plane. (Hint: You may want to make use of exercise 2.2.) In terms of your constructors and selectors, create procedures that compute the perimeter and the area of a given rectangle. Now implement a different representation for rectangles. Can you design your system with suitable abstraction barriers, so that the same perimeter and area procedures will work using either representation?
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; I'm adding this constraint: the sides are parallel/perpendicular to the axes.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Store as points

(define (make-rectangle-stored-as-points bottom-left top-right)
  (cons bottom-left top-right))

(define (bottom-left-rectangle-stored-as-points r)
  (car r))

(define (top-right-rectangle-stored-as-points r)
  (cdr r))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Store as segments

(define (make-rectangle-stored-as-segments bottom-left top-right)
  (cons 
   (make-segment ; left side
    bottom-left
    (make-point
     (x-point bottom-left)(y-point top-right)))
   (make-segment ; bottom side
    bottom-left
    (make-point
     (x-point top-right)(y-point bottom-left)))))

(define (bottom-left-rectangle-stored-as-segments r)
  (let ((left-side (car r)))
    (start-segment left-side)))

(define (top-right-rectangle-stored-as-segments r)
  (let ((left-side (car r))
        (bottom-side (cdr r)))
    (make-point
     (x-point (end-segment bottom-side))
     (y-point (end-segment left-side)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (square x) (* x x))

(define (length-segment s)
  (let ((x (abs (- (x-point (start-segment s)) (x-point (end-segment s)))))
        (y (abs (- (y-point (start-segment s)) (y-point (end-segment s))))))
    (sqrt (+ (square x) (square y)))))

(define (run-examples make-rectangle bottom-left-rectangle top-right-rectangle)  
  ;;;;;;;;;;;;;;;;;;;
  ; Rectangle functions in terms of supplied rectangle functions
  (define (left-side-of-rectangle r)
    (make-segment
     (bottom-left-rectangle r)
     (make-point (x-point (bottom-left-rectangle r)) (y-point (top-right-rectangle r)))))
  
  (define (bottom-side-of-rectangle r)
    (make-segment
     (bottom-left-rectangle r)
     (make-point (x-point (top-right-rectangle r)) (y-point (bottom-left-rectangle r)))))
  
  (define (perimeter-rectangle r)
    (+
     (* 2 (length-segment (left-side-of-rectangle r)))
     (* 2 (length-segment (bottom-side-of-rectangle r)))))

  ;;;;;;;;;;;;;;;;;;;
  ; examples
  (check-equal? (perimeter-rectangle
                 (make-rectangle
                  (make-point 2 2)
                  (make-point 4 5)))
                10)
  
  (check-equal? (perimeter-rectangle
                 (make-rectangle
                  (make-point 2 2)
                  (make-point 5 6)))
                14))

(run-examples
 make-rectangle-stored-as-points
 bottom-left-rectangle-stored-as-points
 top-right-rectangle-stored-as-points)

(run-examples
 make-rectangle-stored-as-segments
 bottom-left-rectangle-stored-as-segments
 top-right-rectangle-stored-as-segments)

