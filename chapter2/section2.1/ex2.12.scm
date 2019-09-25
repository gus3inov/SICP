(define (make-interval a b) (cons a b))

(define (make-center-width c w) (make-interval (- c w) (+ c w)))

(define (center i)
    (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
    (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent a e) 
  (let ((w (* a e))) 
    (make-center-width a e)))

(define (percent i)
  (/ (width i)
     (center i))
