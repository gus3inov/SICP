(define (horner x cs)
  (accumulate (lambda (this-coeff higher-terms)
  (+ this-coeff (* higher-terms x))) 0 cs))

(horner 2 (list 1 3 0 5 0 1))
