(define (split tf bf)
  (define (drawer painter n)
    (if (= n 0)
      painter
      (let ((smaller (drawer painter (- n 1))))
        (tf painter (bf smaller smaller))))) drawer)