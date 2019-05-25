(define (accumulate combiner null-value term a next b)
  (if (> a b) 
      null-value
      (combiner (term a)
        (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b) 
  (define (iter a accumulator) 
    (if (> a b) 
        accumulator 
        (iter (next a) 
              (combiner accumulator (term a))))) 
  (iter a null-value))

(define (inc n) (+ n 1))

(define (plus a b) (+ a b))

(define (multiply a b) (* a b))

(define (sum a b)
  (accumulate plus 0 cube a inc b))

(sum 2 5)