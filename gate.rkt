#lang racket

(require "wire.rkt"
         framework/notify)

(define (listen w1 w2 compute)
  (send w1 listen compute)
  (send w2 listen compute))

(define (or-gate w1 w2 output-w)
  (define (compute v)
    (set-signal! output-w (or (get-signal w1) (get-signal w2))))
  (listen w1 w2 compute)
  (compute 0))
(define (and-gate w1 w2 output-w)
  (define (compute v)
    (set-signal! output-w (and (get-signal w1) (get-signal w2))))
  (listen w1 w2 compute)
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
