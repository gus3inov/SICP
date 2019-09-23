(define (div-interval x y)
    (if (and (= (upper-bound y) 0) (= (lower-bound y) 0))
        (error "Zero should be not exist in interval")
    (mul-interval x
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))
