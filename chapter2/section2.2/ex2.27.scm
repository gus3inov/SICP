(define (deep-reverse items)
  (define (reverse item)
        (if (list? item) (deep-reverse item) item))
  (define (reverse-iter list1 list2)
    (if (null? list1) list2
        (reverse-iter (cdr list1) (cons (reverse (car list1)) list2))))
  (reverse-iter items (list)))
