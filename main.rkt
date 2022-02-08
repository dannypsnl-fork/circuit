#lang racket
(provide half-adder
         full-adder
         make-wire
         get-signal)

(require "wire.rkt"
         "gate.rkt")

(define (half-adder a b s c)
  (let ([d (make-wire)]
        [e (make-wire)])
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)))

(define (full-adder a b c-in sum c-out)
  (let ([s (make-wire)]
        [c1 (make-wire)]
        [c2 (make-wire)])
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)))

(module+ test
  (require rackunit)

  (test-case
   "full adder"
   (let ([a (make-wire 1)]
         [b (make-wire 1)]
         [c-in (make-wire)]
         [sum (make-wire)]
         [c-out (make-wire)])
     (full-adder a b c-in sum c-out)
     (check-equal? (get-signal sum) 0)
     (check-equal? (get-signal c-out) 1))))
