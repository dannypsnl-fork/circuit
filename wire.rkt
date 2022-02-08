#lang racket
(provide make-wire
         get-signal
         set-signal!)

(require "notify-box.rkt")

(define (make-wire [v 0])
  (new notify-box% (value v)))

(define (get-signal w)
  (send w get))

(define (set-signal! w new-s)
  (send w set new-s))

(module+ test
  (require rackunit)

  (define m (make-wire))
  (set-signal! m 1)
  (check-eq? (get-signal m) 1))
