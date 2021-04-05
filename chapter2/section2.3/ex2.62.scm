(define (union-set set1 set2)
  (cond ((and (null? set2) (not (null? set1))) set1)
        ((and (null? set1) (not (null? set2))) set2)
        ((and (null? set1) (null? set2)) `())
        (else (cond
          ((= (car set1) (car set2)) (cons (car set1) (union-set (cdr set1) (cdr set2))))
          ((< (car set1) (car set2)) (cons (car set1) (union-set (cdr set1)  set2)))
          (else (cons (car set2) (union-set set1 (cdr set2))))))))
