#lang scheme

(provide expect)

(define (expect outcome example)
  (cond
    ((eq? outcome example) (display "."))
    (else
      (display (string-append
              (string-append "\nexpected " (number->string outcome))
              (string-append ", got " (number->string example))
              "\n"
              )))))