(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; (dot-product (list 1 2 3 4) (list 5 6 2 1))

(define (matrix-*-vector m v)
  (map (lambda (vi) (accumulate + 0 (map * vi v))) m))

; (matrix-*-vector matrix (list 5 3 2 1))

(define (transpose mat)
  (accumulate-n (lambda (x y) (cons x y)) nil mat))

; (transpose (list (list 1 2 3) (list 4 5 6)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (mi) (matrix-*-vector cols mi)) m)))

; (matrix-*-matrix (list (list 2 3 4) (list 1 2 0) (list 2 3 1)) (list (list 1 2) (list 3 4) (list 5 6)))