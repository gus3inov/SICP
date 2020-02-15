(define (below painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-bottom
           (transform-painter painter1
                              (make-vect 0.0 0.0)   
                              (make-vect 1.0 0.0)
                              split-point))
          (paint-top
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

(define (below painter1 painter2) 
  (rotate-90 (beside (rotate-270 painter1) 
                     (rotate-270 painter2))))
                     
(define (below painter1 painter2) 
  (rotate-270 (beside (rotate-90 painter2) 
                      (rotate-90 painter1))))
