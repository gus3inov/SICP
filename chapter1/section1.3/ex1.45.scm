(define (power a b) 
  (exp (* b (log a))))

(define (average-damp f)
(lambda (x) (average x (f x))))

;; fixed-point - ex1.40
;; repeated - 1.43
(define (root n x) 
  (define (f y) (/ x (power y (- n 1)))) 
  (fixed-point ((repeated average-damp (floor ((lambda (x) (/ (log x) (log 2))) n))) f) 1.0))

(root 4 16)
;; -> 2.0000000000021965

(root 4 81)
;; -> 3.0000000000000333
