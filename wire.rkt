#lang racket

(require framework/notify)

(define (make-wire)
  (new notify:notify-box% (value 'invalid)))

(define (get-signal w)
  (send w get))

(define (set-signal! w new-s)
  (send w set new-s))

(module+ test
  (require rackunit)

  (define m (make-wire))
  (set-signal! m 1)
  (check-eq? (get-signal m) 1))
