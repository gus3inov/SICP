(define (square x) 
  (* x x))

(define (expmod base exp m) 
  (cond ((= exp 0) 1) 
        ((even? exp) 
         (remainder (square (expmod base (/ exp 2) m)) 
                    m)) 
        (else 
         (remainder (* base (expmod base (- exp 1) m)) 
                    m))))

(define (test a n) 
  (= (expmod a n n) a))

(define (test-all n)
  (test-all-from n 1))

(define (test-all-from n start) 
  (if (< start n) 
        (if (test start n) 
            (test-all-from n (+ start 1)) 
            false) 
        true))

Запустим сначала эту процедуру на нескольких числах:

(test-all 1009) 
; #t 
(test-all 1008) 
; #f 
(test-all 1000003) 
; #t

; Как видим, для простых чисел возвращается истина, а для составных – ложь. Все как и следовало ожидать.

; Теперь проверим несколько первых чисел Кармайкла (561, 1105, 1729, 2465, 2821 и 6601):

(test-all 561) 
; #t 
(test-all 1105) 
; #t 
(test-all 1729) 
; #t 
(test-all 2465) 
; #t 
(test-all 2821) 
; #t 
(test-all 6601) 
; #t 

; На всех этих числах тест Ферма проходит, но в то же время они составные.