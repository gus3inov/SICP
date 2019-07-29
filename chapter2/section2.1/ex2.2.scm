(define (start-segment start-point) (car start-point))

(define (end-segment end-point) (cdr end-point))

(define (make-segment start-point end-point)
    (cons start-point end-point))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-point x y)
    (cons x y))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define (midpoint-segment segment)
    (print-point (make-point (/ (+ (x-point (start-segment segment)) (x-point (end-segment segment))) 2)
    (/ (+ (y-point (start-segment segment)) (y-point (end-segment segment))) 2))))


(define my-segment (make-segment (make-point -1 3) (make-point 6 5)))

(midpoint-segment my-segment)
