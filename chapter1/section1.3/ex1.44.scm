; Сглаженная функция должна возвращать среднее значение в точке x: f(x − dx), f(x) и f(x + dx)
; Её можно выразить очень просто, вычислив среднее арифметическое трех выражений :

(define (smooth f)
    (lambda (dx x) (/ (+ (f (- x dx)) x (f (+ x dx)) 3))))

; Данная функция, возвращает функцию, которая принимает в себя два аргумента: x dx
; где x - любое целое число, а dx - некоторое малое число

; Пример вызова функции

(define (add? count)
  (lambda (x) (+ x count)))

((smooth (add? 5)) 0.00001 10)

;; -> 13.333333333333334

; Теперь опишем n-кратно сглаженную функцию с помощью smooth и repeated из упражнения 1.43

;; from ex1.43.scm
(define (repeated f repeat-count)
  (define (carrying z)
    (lambda (x) (z (f x))))
  (define (try-repeated inc acc)
    (if (= inc repeat-count)
      (lambda (a) (acc a))
      (try-repeated (+ inc 1) (carrying acc))))
  (try-repeated 1 (carrying (lambda (x) x))))

; n-кратно сглаженная функция
(define (n-fold-smooth x)
  ((smooth (add? 5)) 0.00001 x))

((repeated n-fold-smooth 1) 10)
;; -> 0.025

((repeated n-fold-smooth 5) 10)
;; -> 26.666666666666675
