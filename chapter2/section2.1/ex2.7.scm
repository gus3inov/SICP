; Для реализации селекторов верхней и нижней границы, можно положиться на последовательность
; переданных аргументов, но эта реализация будет не интуитивно понятная, для этого в теле процендур,
; будет происходить проверка на большее и меньшее значение в качестве результата процедур


(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (if (< (car interval) (cdr interval)) (cdr interval)
    (car interval)))

(define (lower-bound interval)
  (if (> (car interval) (cdr interval)) (cdr interval)
    (car interval)))

;; Example

(define my-interval (make-interval 10 5))

(lower-bound my-interval)
;; -> 5

(upper-bound my-interval)
;; -> 10
