; ---recursion--- 
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
          (product term (next a) next b))))

; ---iterative---
(define (product term a next b) 
  (define (iter a accumulator) 
    (if (> a b) 
        accumulator 
        (iter (next a) (* accumulator (term a))))) 
  (iter a 1))

  
; ---factorial--- 
(define (factorial n)
  (define (idx a) a)
  (define (inc x) (+ x 1))
  (product idx 1 inc n))

(factorial 5)

; ---p---
(define (pi n) 
  (define (pi-term k) 
    (/ (* (- k 1) (+ k 1)) (square k))) 
  (define (pi-next k) 
    (+ k 2)) 
  (* 4 (product pi-term 3 pi-next n)))