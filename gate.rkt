#lang racket

(provide inverter
         or-gate
         and-gate)

(require "wire.rkt"
         framework/notify)

(define (listen compute . rest)
  (for ([w rest])
    (send w listen compute)))

(define (inverter in out)
  (define (compute v)
    (set-signal! out (not (get-signal in))))
  (listen compute in)
  (compute 0))
(define (or-gate w1 w2 output-w)
  (define (compute v)
    (set-signal! output-w (or (get-signal w1) (get-signal w2))))
  (listen compute w1 w2)
  (compute 0))
(define (and-gate w1 w2 output-w)
  (define (compute v)
    (set-signal! output-w (and (get-signal w1) (get-signal w2))))
  (listen compute w1 w2)
  (compute 0))

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
   (check-eq? (get-signal c) #f))

  (test-case
   "and-gate"
   (define a (make-wire #t))
   (define b (make-wire))
   (define c (make-wire))
   (and-gate a b c)
   (check-eq? (get-signal c) #f)
   (set-signal! b #t)
   (check-eq? (get-signal c) #t)))
