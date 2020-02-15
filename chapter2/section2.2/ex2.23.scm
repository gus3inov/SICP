(define (reverse items)
  (define (reverse-iter list1 list2)
    (if (null? list1)
        list2
        (reverse-iter (cdr list1) (cons (car list1) list2))))
  (reverse-iter items (list)))

(define (for-each proc items)
  (define reversed-items (reverse items))
  (define (for-each-rec source)
    (if (null? source)
        items
        (proc (car source)
        (for-each-rec (cdr source)))))
  (for-each-rec reversed-items))

(for-each (lambda (x) (newline) (display x))
    (list 57 321 88))


;; correct solution

(define (for-each proc items)
  (cond ((not (null? items))
         (proc (car items)) (for-each proc (cdr items)))))