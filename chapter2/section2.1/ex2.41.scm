(define (make-triple i j k ) (list i j k))

(define (unique-trio n)
  (flatmap
   (lambda(i)
     (flatmap
      (lambda (j)
        (map (lambda (k) (make-triple i j k))
             (enumerate-interval 1 (- j 1))))
      (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 n)))

(define (trio-sum s n) 
  (filter (lambda (trios) (= (accumulate + 0 trios) s)) (unique-trio n)))
