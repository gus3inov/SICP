(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define golden-ratio (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0 0.000001))

(define (cont-frac n d k) 
    (define (iter i) 
      (/ (n i) (+ (d i) 
                  (if (< i k) 
                      (iter (+ i 1)) 
                      0)))) 
    (iter 1))


(define (count-iterations function value tolerance)
  (define (try k)
    (define (close-enough? a b)
      (< (abs (- a b)) tolerance))
    (if (close-enough? (function k) value)
      k
      (try (+ k 1))))
  (try 1))

(define (golden-ratio-function k)
  (/ 1 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)))

(count-iterations golden-ratio-function golden-ratio 0.00001)
;; -> 13

; Исходя из этого, мы можем понять что, хватит 13 для того что-бы получить приближение с точностью до 4 цифры после запятой 

; Так выглядить итеративный процесс
(define (cont-frac n d k) 
    (define (iter i accum) 
      (let ((accum (/ (n i) (+ (d i) accum))) 
            (i (- i 1))) 
        (if (> i 0) 
            (iter i accum) 
            accum))) 
    (iter k 0)) 