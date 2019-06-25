; В решении которое предложил Хьюго:

(define (expmod base exp m)
    (cond ((= exp 0) 1)
        ((even? exp)
        (remainder (* (expmod base (/ exp 2) m)
                        (expmod base (/ exp 2) m))
                    m))

; Два раза вычисляется одна и та же операции, которая даёт одинаковый результат,
; это напрямую влияет на порядок роста процедуры.

; Вариант со square имеет более оптимизированный порядок роста O(log n),
; так как интерпретатор сначала вычисляет аргумент, а только потом его редуцирует
; таким образом мы делаем только одно вычисление при одном вызове, вместо двух