(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile) (make-branch (count-leaves (car mobile)) (car mobile)))

(define (right-branch mobile) (make-branch (count-leaves (cdr mobile)) (cdr mobile)))

(define (branch-length branch) (car branch))

(define (branch-structure branch) (cdr branch))

(define (total-weight items)
  (define (total-weight-it item)
    (if (list? item) (total-weight item) item))
  (define (total-weight-list-iter src sum)
    (if (null? src) sum
      (total-weight-list-iter (cdr src) (+ (total-weight-it (car src)) sum))))
  (total-weight-list-iter items 0))

(define (is-mobile-balanced mobile)
  (define (branch-balance branch)
    (* (branch-length branch) (total-weight (branch-structure branch))))
  (= (branch-balance (left-branch mobile)) (branch-balance (right-branch mobile))))

;; при изменения конструкторов на такой вид:

(define (make-mobile left right) (cons left right))

(define (make-branch length structure) (cons length structure))

;; ничего из вышеописанных конструкций менять не нужно.
