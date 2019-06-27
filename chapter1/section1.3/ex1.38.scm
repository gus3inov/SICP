(define (e k) 
  (+ 2 (cont-frac (lambda (i) 1.0) 
                  (lambda (i) (if (= (remainder i 3) 2) 
                                     (* 2 (/ (+ i 1) 3)) 
                                     1)) 
                  k)))

(e 10) 
; -> 2.7182817182817183 
(e 100)
; -> 2.7182818284590455