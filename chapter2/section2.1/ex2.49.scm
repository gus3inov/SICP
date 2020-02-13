(define (draw-line v1 v2)
  (send dc draw-line
        (xcor-vect v1) (ycor-vect v1)
        (xcor-vect v2) (ycor-vect v2)))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

;; a.
(define a-painter (segments->painter 
                   (list (make-segment 
                          (make-vect 0 0) 
                          (make-vect 0 1))
                         (make-segment 
                          (make-vect 0 1) 
                          (make-vect 1 1))
                         (make-segment
                          (make-vect 1 1)
                          (make-vect 1 0))
                         (make-segment
                          (make-vect 1 0)
                          (make-vect 0 0)))))

(a-painter (make-frame (make-vect 0 0) (make-vect 0 99) (make-vect 99 0)))

;; b.
(define b-painter (segments->painter 
                   (list (make-segment 
                          (make-vect 0 0) 
                          (make-vect 1 1))
                         (make-segment 
                          (make-vect 0 1) 
                          (make-vect 1 0)))))

(b-painter (make-frame (make-vect 0 0) (make-vect 0 100) (make-vect 100 0)))

;; c
(define c-painter (segments->painter 
                   (list (make-segment 
                          (make-vect 0 0.5) 
                          (make-vect 0.5 0))
                         (make-segment 
                          (make-vect 0.5 0) 
                          (make-vect 1 0.5))
                         (make-segment
                          (make-vect 1 0.5)
                          (make-vect 0.5 1))
                         (make-segment
                          (make-vect 0.5 1)
                          (make-vect 0 0.5)))))

(c-painter (make-frame (make-vect 0 0) (make-vect 0 100) (make-vect 100 0)))
