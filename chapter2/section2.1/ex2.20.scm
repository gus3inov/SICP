(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2))))

(define (filter cb items)
  (define (filter-iter source result)
    (if (null? source)
      result
      (if (cb (car source))
        (filter-iter (cdr source) (append result (list (car source))))
        (filter-iter (cdr source) result))))
  (filter-iter items (list)))

(define (same-parity a . b)
  (if (even? a)
    (filter (lambda (x) (even? x)) (cons a b))
    (filter (lambda (x) (odd? x)) (cons a b))))

(same-parity 1 2 3 4 5 6 7)
;; (1 3 5 7)

(same-parity 2 3 4 5 6 7)
;; (2 4 6)