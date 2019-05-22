(define (even? n)
  (= (remainder n 2) 0))

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
          (sum term (next a) next b))))

(define (integral-simpson f a b n)
  (define h (/ (- b a) n)) 
  (define (g k)
    (define (condition k)
      (cond ((= k 0) 1)
            ((= k n ) 1)
            ((even? k) 2)
            (else 4)))
    (* (condition k) (f (+ a (* k h)))))
  (define (inc k) (+ k 1))
  (/ (* (sum g 0 inc n) h) 3))

; Интегрируя с помощью этой процедуры функцию f(x)=x3 между 0 и 1 с n=100 и n=1000, получим:

(integral-simpson 0 1 100) 
; 1/4 
(integral-simpson 0 1 1000) 
; 1/4

; Этим можно доказать что формула Симпсона даёт более точный результат, чем формула центральных прямоугольников,
; использовавшаяся в процедуре integral из основного текста раздела.