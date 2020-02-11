(define (split tf bf)
  (lambda (painter n)
    (if (= n 0)
      painter
      (let ((smaller (split painter (- n 1))))
        (tf painter (bf smaller smaller)))))
