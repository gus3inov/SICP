(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (make-pair i j) (list i j))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (make-pair i j))
               (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter
      prime-sum?
      (unique-pairs n))))