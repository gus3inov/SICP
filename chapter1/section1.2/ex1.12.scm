;;; Exercise 1.10 
;;; =============

(define (pascal-triangle row col)
  (cond ((= col 0) 1) 
        ((= row col) 1)
        (else (+ (pascal-triangle (- row 1) (- col 1)) (pascal-triangle (- row 1) col)))))

(pascal-triangle 8 7)

;Value: 8