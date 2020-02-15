;; variant 1
(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

;; variant 2

(define (reverse items)
  (define (reverse-iter list1 list2)
    (if (null? list1)
        list2
        (reverse-iter (cdr list1) (cons (car list1) list2))))
  (reverse-iter items (list)))