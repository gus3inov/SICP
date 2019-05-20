(define (next n) 
  (if (= n 2) 
      3 
      (+ n 2)))

(define (find-divisor n test-divisor) 
  (cond ((> (square test-divisor) n) n) 
        ((divides? test-divisor n) test-divisor) 
        (else (find-divisor n (next test-divisor)))))

; Можно говорить, что для достаточно больших чисел ускорение действительно практически в два раза.
; Для маленьких чисел это не так, что можно объяснить,
; в первую очередь, увеличившимися накладными расходами в процедуре (find-divisor), которые “съедают” выигрыш от усечения множества перебираемых кандидатов в простые числа.