(define (adjoin-set x set)
   (if (element-of-set? x set)
       set
       (cons x set)))

(define (union-set set1 set2)
  (cond ((and (null? set2) (not (null? set1))) set1)
        ((and (null? set1) (not (null? set2))) set2)
        ((and (null? set1) (null? set2)) `())
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)))))
