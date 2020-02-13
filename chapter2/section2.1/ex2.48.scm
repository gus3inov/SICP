(define (make-segment start-x start-y end-x end-y)
  (cons (make-vect start-x start-y) (make-vect end-x end-y)))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))
