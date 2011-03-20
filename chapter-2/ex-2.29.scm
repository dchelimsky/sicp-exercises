#lang scheme

(require rackunit)

; A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it from two branches (for example, using list):

(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure, which may be either a number (representing a simple weight) or another mobile:

(define (make-branch length structure)
  (list length structure))

; a.  Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile, and branch-length and branch-structure, which return the components of a branch.

(define left-branch car)
(define right-branch last)
(define branch-length car)
(define branch-structure last)

;;;;;;;;;;;;;;;;;;;;;
; ** Examples **
(define example-left-branch
  (make-branch 3 4))

(define example-right-branch (make-branch 4
                                          (make-mobile
                                           (make-branch 1 2)
                                           (make-branch 1 1))))

(define (example-mobile)
  (make-mobile example-left-branch example-right-branch))

(check-equal? (left-branch (example-mobile)) example-left-branch)
(check-equal? (right-branch (example-mobile)) example-right-branch)
(check-equal? (branch-length (left-branch (example-mobile))) 3)
(check-equal? (branch-length (right-branch (example-mobile))) 4)
(check-equal? (branch-structure (left-branch (example-mobile))) 4)
(check-equal?
 (branch-structure (right-branch (example-mobile)))
 (make-mobile
  (make-branch 1 2)
  (make-branch 1 1)))
; ^^ Examples ^^
;;;;;;;;;;;;;;;;;;;;;

; b.  Using your selectors, define a procedure total-weight that returns the total weight of a mobile.

(define (total-weight mobile)
  (define (branch-weight branch)
    (let ((structure (branch-structure branch)))
      (if (pair? structure)
          (total-weight structure)
          structure)))
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else
         (+ (branch-weight (left-branch mobile))
            (branch-weight (right-branch mobile))))))

;;;;;;;;;;;;;;;;;;;;;
; ** Examples **
(check-equal? (total-weight (example-mobile)) 7)
; ^^ Examples ^^
;;;;;;;;;;;;;;;;;;;;;

; c.  A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal to the corresponding product for the right side) and if each of the submobiles hanging off its branches is balanced. Design a predicate that tests whether a binary mobile is balanced.

(define (torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

;;;;;;;;;;;;;;;;;;;;;
; ** Examples **
(check-equal? (torque (make-branch 3 5)) 15)
(check-equal? (torque (make-branch 3 (make-mobile (make-branch 2 4) (make-branch 3 5)))) 27)
; ^^ Examples ^^
;;;;;;;;;;;;;;;;;;;;;

(define (balanced? mobile)
  (= (torque (left-branch mobile)) (torque (right-branch mobile))))

;;;;;;;;;;;;;;;;;;;;;
; ** Examples **
(define (balanced-mobile)
  (make-mobile
   (make-branch 3 4)
   (make-branch 3 4)
   ))

(define (unbalanced-mobile)
  (make-mobile
   (make-branch 7 (balanced-mobile))
   (make-branch 1 2)))

(check-true (balanced? (balanced-mobile)))
(check-false (balanced? (unbalanced-mobile)))
; ^^ Examples ^^
;;;;;;;;;;;;;;;;;;;;;

; d.  Suppose we change the representation of mobiles so that the constructors are

; (define (make-mobile left right)
;   (cons left right))
;
; (define (make-branch length structure)
;   (cons length structure))

; How much do you need to change your programs to convert to the new representation?

;;;;;;;;;;;;;;;;;;;;;;
;
;  ANSWER
;
;  If you define other functions in terms of left-branch and right-branch, as above, then the only changes needed are:
;
; (define right-branch cdr)
; (define branch-structure cdr)
