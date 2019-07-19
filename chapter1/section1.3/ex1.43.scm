(define (repeated f repeat-count)
  (define (carrying z)
    (lambda (x) (z (f x))))
  (define (try-repeated inc acc)
    (if (= inc repeat-count)
      (lambda (a) (acc a))
      (try-repeated (+ inc 1) (carrying acc))))
  (try-repeated 1 (carrying (lambda (x) x))))

((repeated square 2) 5)

;; -> 625

