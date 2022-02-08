#lang scribble/manual

@require[@for-label[circuit
                    racket/base]]

@title{circuit}
@author{Lîm Tsú-thuàn}

@defmodule[circuit]

@defproc[(make-wire [n integer?])
  any/c
]{
  @code{make-wire} takes an integer wire's value, default is @code{0}
}
@defproc[(get-signal [wire any/c])
  integer?
]{
  @code{get-signal} get internal value from a wire
}

inverter
@defproc[(and-gate [in1 any/c] [in2 any/c] [out any/c])]{
  @code{and-gate} takes two input wires and one output wire.
}
@defproc[(or-gate [in1 any/c] [in2 any/c] [out any/c])]{
  @code{or-gate} takes two input wires and one output wire.
}
@defproc[(inverter [in any/c] [out any/c])]{
  @code{inverter} takes one input wire and one output wire.
}
