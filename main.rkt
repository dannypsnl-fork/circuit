#lang racket

(require "wire.rkt"
         "gate.rkt")

(define (half-adder a b s c)
  (let ([d (make-wire)]
        [e (make-wire)])
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)))

(module+ test
  (require rackunit)

  (define expected 1)
  (define actual 1)

  (test-case
    "Example Test"
    (check-equal? actual expected))

  (test-equal? "Shortcut Equal Test" actual expected))
