#|
Exercise 1.39: A continued fraction representation of the
tangent function was published in 1770 by the German math-
ematician J.H. Lambert:
tan x = 
         x
  --------------
   1 -    x^2
      ----------
      3 -  x^2
	 -------
      	 5 - ...
	  
where x is in radians. Define a procedure (tan-cf x k) that
computes an approximation to the tangent function based
on Lambert’s formula. k specifies the number of terms to
compute, as in Exercise 1.37
|#

(define (cont-frac n d k)
  (define (iter a)
    (if (= a k)
      0
      ( / (n a) (+ (d a) (iter (+ a 1))))
      )
    )
     
  (iter 1)
)

(define (tan-cf x k)
  (cont-frac 
    (lambda (i) 
      (if (= i 1) x (- (* x x))))
    (lambda (i) (- (* i 2) 1))
    k)
  )


(define quarter-pi (atan 1))

(print (tan-cf quarter-pi 5))
