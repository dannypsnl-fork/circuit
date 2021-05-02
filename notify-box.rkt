#lang racket

(provide notify-box%)

(require racket/class)

(define notify-box%
  (class object%
    (init-field value)

    (define listening* '())

    (define/public (get)
      value)
    (define/public (set new-v)
      (set! value new-v)
      (for ([l listening*])
        (l new-v)))
    (define/public (listen f)
      (set! listening* (cons f listening*)))
    (super-new)))
