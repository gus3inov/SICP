; Для того, что бы определить операции one и two через лямбда исчисления, разобъем 
; вызов процедуры (add-1 zero) с помощью подстановочной модели

;;0¯=λs . λz . z
(define zero (lambda (f) (lambda (x) x)))

; add-1=λn . λs . λz . s (n s z)
(define (add-1 n)
    (lambda (s) (lambda (z) (s ((n s) z)))))

(add-1 zero)

;; Псевдокод

(lambda (f) (lambda (x) (f ((lambda (f) (lambda (x) x) f) x))))

; Из этого можно исходить следующим образом:
; На основе лямбда-исчислений можно вводить аналог натуральный числе,
; основанный на идее, что натуральное число — это или ноль, или увеличенное на единицу натуральное число.

; Каждое число будет функцией двух аргументов: какой-то функции и начального значения. 
; Число n будет n раз применять функцию к начальному значению и возвращать результат.
; Если такому "числу" дать на вход функцию (+1) и 0 в качестве начального значения, 
; то на выходе как раз будет ожидаемое от функции число: 3¯ (+1) 0≡3.


;;1¯=λs . λz . s z
(define one (lambda (f) (lambda (x) (f x))))

;;2¯=λs . λz . s (s z)
(define two (lambda (f) (lambda (x) (f (f x)))))

; Сложение двух чисел похоже на прибавление единицы. 
; Но только надо прибавить не единицу, а второе число.

;; add=λn . λm . λs . λz . n s (m s z)
(define (add n)
    (lambda (m) (lambda (s) (lambda (z) (n (s m s z))))))