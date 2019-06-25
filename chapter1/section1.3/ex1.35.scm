; Как сказано в разделе 1.2.2 золотое сечение соответствует уравнению

; f^2 = f + 1
; f - число PHi

; Из чего следует что обе части равенства f = 1 + 1/f. Этим можно доказать что f является неподвижной точкой трансформации:
; x -> 1 + 1/x

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

(define (sqrt x)
    (fixed-point (lambda (y) (average y (/ x y)))
        1.0))

(define golden-ratio (/ 2 (+ 1 (sqrt 5))))

(define (golden-ratio-point x)
  (fixed-point (lambda (y) (+ 1 (/ 1 y))) x))

(golden-ratio-point golden-ratio)

;; -> 1.6180327868852458