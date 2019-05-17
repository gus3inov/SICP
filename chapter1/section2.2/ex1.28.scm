; Это упражнение немного заковыристо сформулировано, но сложным не является.

; Вот код модифицированной процедуры expmod, которая сигнализирует о нахождении нетривиального квадратного корня из 1, возвращая 0 (как и рекомендовано в условии).

(define (square x) 
  (* x x))
(define (apply-trivial-check k m r) 
  (if (and (not (= k 1)) 
           (not (= k (- m 1))) 
           (= r 1)) 
      0 
      r))
(define (remainder-or-trivial k m) 
  (apply-trivial-check k m (remainder (square k) m)))
(define (modified-expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder-or-trivial (modified-expmod base (/ exp 2) m) m)) 
        (else 
         (remainder (* base (modified-expmod base (- exp 1) m)) 
                    m))))

; Теперь запишем всю процедуру, реализующую тест Миллера-Рабина. Она прогоняет для заданного числа n модифицированный тест Ферма на всех числах a<n и подсчитывает количество успехов.
; Если их больше половины, то число в соответствии с тестом Миллера-Рабина идентифицируется как простое. В противном случае оно составное.

(define (miller-rabin-test n) 
  (define (miller-rabin-iteration a t n) 
    (define (try-it a) 
      (= (modified-expmod a (- n 1) n) 1)) 
    (if (= a n) 
        (> t (/ n 2)) 
        (if (try-it a) 
            (miller-rabin-iteration (+ a 1) (+ t 1) n) 
            (miller-rabin-iteration (+ a 1) t n)))) 
  (miller-rabin-iteration 1 0 n))

; Проверим написанную процедуру на нескольких простых и составных числах:

> (miller-rabin-test 5) 
#t 
> (miller-rabin-test 15) 
#f 
> (miller-rabin-test 97) 
#t 
> (miller-rabin-test 121) 
#f 
> (miller-rabin-test 1003) 
#f 
> (miller-rabin-test 1009) 
#t 
> (miller-rabin-test 100003) 
#t 
> (miller-rabin-test 100005) 
#f

; Теперь проверим первые 6 чисел Кармайкла:

> (miller-rabin-test 561) 
#f 
> (miller-rabin-test 1105) 
#f 
> (miller-rabin-test 1729) 
#f 
> (miller-rabin-test 2465) 
#f 
> (miller-rabin-test 2821) 
#f 
> (miller-rabin-test 6601) 
#f

; Как видим, определение простоты проходит корректно во всех случаях.