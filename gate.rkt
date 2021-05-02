#lang racket

(provide inverter
         or-gate
         and-gate)

(require "wire.rkt"
         framework/notify)

(define (listen compute . rest)
  (for ([w rest])
    (send w listen compute)))
(define/match (logical-not v)
  [(0) 1]
  [(1) 0])
(define/match (logical-or a b)
  [(0 1) 1]
  [(1 0) 1]
  [(1 1) 1]
  [(0 0) 0])
(define/match (logical-and a b)
  [(0 1) 0]
  [(1 0) 0]
  [(1 1) 1]
  [(0 0) 0])

(define (inverter in out)
  (define (compute v)
    (set-signal! out (logical-not (get-signal in))))
  (listen compute in)
  (compute 0))
(define (or-gate w1 w2 output-w)
  (define (compute v)
    (set-signal! output-w (logical-or (get-signal w1) (get-signal w2))))
  (listen compute w1 w2)
  (compute 0))
(define (and-gate w1 w2 output-w)
  (define (compute v)
    (set-signal! output-w (logical-and (get-signal w1) (get-signal w2))))
  (listen compute w1 w2)
  (compute 0))

(module+ test
  (require rackunit)

  (test-case
   "or-gate"
   (define a (make-wire 1))
   (define b (make-wire))
   (define c (make-wire))
   (or-gate a b c)
   (check-eq? (get-signal c) 1)
   (set-signal! a 0)
   (check-eq? (get-signal c) 0))

  (test-case
   "and-gate"
   (define a (make-wire 1))
   (define b (make-wire))
   (define c (make-wire))
   (and-gate a b c)
   (check-eq? (get-signal c) 0)
   (set-signal! b 1)
   (check-eq? (get-signal c) 1)))
