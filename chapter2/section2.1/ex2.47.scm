(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame1 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame) (car frame))
(define (edge1-frame frame) (car (cdr frame)))
(define (edge2-frame frame) (car (cdr (cdr frame))))

;; -------

(define (origin-frame f)
  (car f))

(define (edge1-frame f)
  (cadr f))

(define (edge2-frame f)
  (caddr f))