#|
Exercise 1.38: In 1737, the Swiss mathematician Leonhard
Euler published a memoir De Fractionibus Continuis, which
included a continued fraction expansion for e - 2, where
e is the base of the natural logarithms. In this fraction, the
Ni are all 1, and the Di are successively 1, 2, 1, 1, 4, 1, 1,
6, 1, 1, 8, . . .. Write a program that uses your cont-frac
procedure from Exercise 1.37 to approximate e, based on
Euler’s expansion.
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


 
  
; how i am supposed to know i needed to multiply by 2/3
(define (approx-e k)
  (define (d i)
    (if (zero? (remainder (+ i 1) 3))
        (* 2/3 (+ i 1))
        1))
  (+ 2 (cont-frac (lambda (i) 1.0) d k)))


(print "1: " (approx-e 1))
(print "4: " (approx-e 4))
(print "1000: " (approx-e 1000))
