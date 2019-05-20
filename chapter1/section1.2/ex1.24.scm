(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
          (remainder (square (expmod base (/ exp 2) m))
            m))
        (else
          (remainder (* base (expmod base (- exp 1)m))
                      m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a)
  (try-it (+ 1 (random (- n 1))))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

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
  (if (fast-prime? n 10000)
    (report-prime (- (runtime) start-time))
    false))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 1009) 
; *** 1610 
(timed-prime-test 1013) 
; *** 1704 
(timed-prime-test 1019)
; *** 1812 
(timed-prime-test 10007) 
; *** 2078 
(timed-prime-test 10009) 
; *** 1985 
(timed-prime-test 10037) 
; *** 2062 
(timed-prime-test 100003)
; *** 2500 
(timed-prime-test 100019)
; *** 2875 
(timed-prime-test 100043) 
; *** 2594 
(timed-prime-test 1000003)
; *** 2953 
(timed-prime-test 1000033) 
; *** 3266 
(timed-prime-test 1000037)
; *** 3266 