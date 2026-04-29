#|
Exercise 1.42: Let f and g be two one-argument functions.
The composition f after g is defined to be the function x -> 
f (g(x)). Define a procedure compose that implements com-
position. For example, if inc is a procedure that adds 1 to
its argument,

((compose square inc) 6)
49
|#

(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))
    )
  )

(print
  ((compose square inc) 6)
)

; square((inc 6)) -> 6 + 1 = 7 * 7 = 49
