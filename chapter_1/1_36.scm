#|
Exercise 1.36: Modify fixed-point so that it prints the
sequence of approximations it generates, using the newline
and display primitives shown in Exercise 1.22. Then find
a solution to x^x = 1000 by finding a fixed point of x ->
log(1000)/ log(x). (Use Scheme’s primitive log procedure,
which computes natural logarithms.) Compare the number
of steps this takes with and without average damping. (Note
that you cannot start fixed-point with a guess of 1, as this
would cause division by log(1) = 0.)
|#


(define (fixed-point f first-guess)
  (define tolerance 0.00001)  
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
      (print "Next approximation: " next)
      (if (close-enough? guess next)
	next
	(try next))))
  (try first-guess)
  )


(define (f x) ( / (log 1000) (log x)))

(print "\n No damping:")
(fixed-point
  f
  2
)

(define (average x y) (/ (+ x y) 2))

(print "\n Now with damping:")
(fixed-point
  (lambda (x) 
    (average x (f x))
      ;(* (/ 1 2) (+ x (/ (log 1000) (log x)))) 
    )
  2
)
