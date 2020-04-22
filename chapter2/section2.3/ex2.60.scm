;; no changes
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;; changed only adjoin-set 
(define (adjoin-set x set)
   (cons x set))

;; no changes
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) `())
        ((element-of-set? (car set1) set2)
         (cons (car set1)
               (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;; no changes, after change adjoin-set, complexity is O(n), before O(n^2)
(define (union-set set1 set2)
  (cond ((and (null? set2) (not (null? set1))) set1)
        ((and (null? set1) (not (null? set2))) set2)
        ((and (null? set1) (null? set2)) `())
        (else (adjoin-set (car set1) (union-set (cdr set1) set2)))))
