#lang racket

(require "wire.rkt"
         framework/notify)

(define (or-gate w1 w2 output-w)
  (define (c v)
    (set-signal! output-w (or (get-signal w1) (get-signal w2))))
  (c 0)
  (send w1 listen c)
  (send w2 listen c))

(module+ test
  (require rackunit)

  (test-case
   "or-gate"
   (define a (make-wire #t))
   (define b (make-wire))
   (define c (make-wire))
   (or-gate a b c)
   (check-eq? (get-signal c) #t)
   (set-signal! a #f)
   (check-eq? (get-signal c) #f)))
