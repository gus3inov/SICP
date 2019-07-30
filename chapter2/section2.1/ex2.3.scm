(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (make-point x y)
    (cons x y))

(define (make-rectangle topleft bottomright) 
  (cons topleft bottomright))

(define (rectangle-topleft rectangle) 
  (car rectangle))

(define (rectangle-bottomright rectangle) 
  (cdr rectangle))

(define (rectangle-perimeter rectangle) 
  (* 2 (+ (rectangle-width rectangle) 
          (rectangle-height rectangle))))

(define (rectangle-area rectangle) 
  (* (rectangle-width rectangle) 
     (rectangle-height rectangle)))

(define (rectangle-width rectangle) 
  (abs (- (x-point (rectangle-topleft rectangle)) 
          (x-point (rectangle-bottomright rectangle)))))

(define (rectangle-height rectangle) 
  (abs (- (y-point (rectangle-topleft rectangle)) 
          (y-point (rectangle-bottomright rectangle)))))

(define my-rectangle (make-rectangle
  (make-point -4 -2)
  (make-point 1 -2)))

(rectangle-perimeter my-rectangle)
