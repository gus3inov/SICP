(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))

(define some-list (list 1 3 5 7))

(display (last-pair some-list))
