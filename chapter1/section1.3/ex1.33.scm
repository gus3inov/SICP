(define (cube x) (* x x x))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (inc n) (+ n 1))

(define (plus a b) (+ a b))

(define (prime? n)
  (= n (smallest-divisor n)))

; --- filter-accumulate ---

(define (filter-accumulate combiner predicat null-value term a next b)
  (if (> a b) 
      null-value
      (if (not (predicat a))
        (filter-accumulate combiner predicat null-value term (next a) next b)
        (combiner (term a)
        (filter-accumulate combiner predicat null-value term (next a) next b)))))

(define (sum-filter a b predicat)
  (filter-accumulate plus predicat 0 cube a inc b))


; --- sum filter ---

(display (sum-filter 3 6 prime?))