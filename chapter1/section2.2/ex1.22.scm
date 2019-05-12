(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes number-from prime-count) 
  (if (> prime-count 0) 
      (if (timed-prime-test number-from) 
          (search-for-primes (+ number-from 1) (- prime-count 1)) 
          (search-for-primes (+ number-from 1) prime-count))))

; --- Perf tests ---

(search-for-primes 1000 3) 
; 1009 *** 0 
; 1013 *** 0 
; 1019 *** 0

(search-for-primes 10000 3) 
; 10007 *** 0 
; 10009 *** 0 
; 10037 *** 0

(search-for-primes 100000 3) 
; 100003 *** 0 
; 100019 *** 0 
; 100043 *** 0

(search-for-primes 1000000 3) 
; 1000003 *** 0 
; 1000033 *** 0 
; 1000037 *** 0

; Как видим, все измеренные временные интервалы нулевые.
; Это связано с тем, что современные компьютеры настолько быстры,
; что успевают выполнить все операции за время,
; меньшее порога чувствительности функции (current-milliseconds).
; Во времена выхода первого и даже второго издания SICP вычислительная мощь компьютеров была куда скромнее.


;Вот что получается, если вычислять по 3 наименьших простых числа,
; начиная с 100 000 000 000, 1 000 000 000 000, 10 000 000 000 000, 100 000 000 000 000:

(search-for-primes 100000000000 3) 
; 100000000003 *** 422 
; 100000000019 *** 672 
; 100000000057 *** 672

(search-for-primes 1000000000000 3) 
; 1000000000039 *** 2328 
; 1000000000061 *** 1922 
; 1000000000063 *** 2062

(search-for-primes 10000000000000 3) 
; 10000000000037 *** 6188 
; 10000000000051 *** 6157 
; 10000000000099 *** 6297

(search-for-primes 100000000000000 3) 
; 100000000000031 *** 19844 
; 100000000000067 *** 21765 
; 100000000000097 *** 21016

; n1=1011,  t1=589 мс
; n2=1012,  t2=2104 мс,  t2/t1=3.57
; n3=1013,  t3=6214 мс,  t3/t2=2.95
; n4=1014,  t4=20875 мс,  t4/t3=3.36

; Все отношения tk+1/tk достаточно близки к √(nk+1/nk)=√10=3.16,
; то есть мы можем говорить, что гипотеза о равенстве порядка роста Θ(√n) подтверждается на практике.