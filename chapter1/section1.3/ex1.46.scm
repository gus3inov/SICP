; Процедура которая принимает две процедуры: проверку, достаточно ли хоро- шо значение, и метод улучшения значения,
; пишется достаточно просто. Так же процедура должна возвращать процедуру, которая принимает начальное значение в качестве аргумента
; и улучшает его,  пока оно не станет достаточно хорошим.

(define (iterative-improve comparator iterative)
  (lambda (x)
    (define (try guess iter)
      (let ((next (iterative guess)))
        (if (comparator guess next)
          next
          (try next (+ iter 1)))))
    (try x 1)))

; Так же легко можно выразить процедуру fixed-point из раздела 1.3.3

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

; И переписываем процедуру sqrt из раздела 1.1.7

(define (sqrt x)
    (fixed-point (lambda (y) (average y (/ x y)))
        1.0))
