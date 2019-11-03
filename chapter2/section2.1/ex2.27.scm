(define (deep-reverse items)
  (define (reverse items)
        (if (list? items) (deep-reverse items) items))
  (define (reverse-iter list1 list2)
    (if (null? list1) list2
        (reverse-iter (cdr list1) (cons (reverse (car list1)) list2))))
  (reverse-iter items (list)))
