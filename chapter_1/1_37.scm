#|
Exercise 1.37:
a. An infinite continued fraction is an expression of the
form

f = N1
D1 + N2
D2 + N3
D3 + . . .

As an example, one can show that the infinite con-
tinued fraction expansion with the Ni and the Di all
equal to 1 produces 1/ϕ, where ϕ is the golden ratio
(described in Section 1.2.2). One way to approximate
an infinite continued fraction is to truncate the expan-
sion aer a given number of terms. Such a truncation—
a so-called k-term finite continued fraction—has the form
N1
D1 + N2
. . . + Nk
Dk
.
Suppose that n and d are procedures of one argument
(the term index i) that return the Ni and Di of the
terms of the continued fraction. Define a procedure
cont-frac such that evaluating (cont-frac n d k)
computes the value of the k-term finite continued frac-
tion. Check your procedure by approximating 1/ϕ us-
ing

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   k)

for successive values of k. How large must you make
k in order to get an approximation that is accurate to
4 decimal places?
b. If your cont-frac procedure generates a recursive pro-
cess, write one that generates an iterative process. If
it generates an iterative process, write one that gen-
erates a recursive process.
|#

; recursive
(define (cont-frac n d k)
  (define (iter k a)
    (if (< a k)
      ( / (n a) (+ (d a) (iter k (+ a 1))))
      0)
    )
     
  (iter k 0)
)

;iterative
(define (cont-frac-iter n d k)
  (define (iter k a acc)
    (if (< a k)
      (iter k (+ a 1) (/ (n a) (+ (d a) acc)))
      acc)
    )
     
  (iter k 0 0)
)


(print "Recursive: " 
  (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 15) 
  )

(print "Iter: " 
  (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 15) 
  )
