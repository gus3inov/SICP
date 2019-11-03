(define (fringe items)
  (define (fringe-iter src result)
    (define (fringe-item item)
      (if (list? item) (append result (fringe item)) (append result (list item))))
    (if (null? src)
      result
      (fringe-iter (cdr src) (fringe-item (car src)))))
  (fringe-iter items (list)))

(define x (list (list 1 2) (list 3 4) (list 4 5 (list 6 7))))

(fringe (list x x))
;; (1 2 3 4 4 5 6 7 1 2 3 4 4 5 6 7)
