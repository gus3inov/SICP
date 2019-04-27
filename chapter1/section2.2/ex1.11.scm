;;; Exercise 1.11
;;; =============

;; Recursive

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (f (- n 2))
                 (f (- n 3))))))

(f 10)
;Value: 230

;; Iterative

(define (f-iter number min-count)
  (cond ((< number min-count) number)
    (else (+ (f-iter  (- number 1) min-count) (f-iter (- number 2) min-count) (f-iter (- number 3) min-count)))))

(define (f number)
  (f-iter number 3))

(f 10)

;Value: 230