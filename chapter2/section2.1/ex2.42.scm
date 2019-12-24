;; ---- std procedures start ----

(define nil '()) 

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
  (op (car sequence)
    (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

;; ---- std procedures end ----

(define empty-board (list))

(define (adjoin-position row k new-queens)
  (cons row new-queens))

(define (safe? k position)
  (define (queens-safe? queen-count rest-rows)
    (define (queen-safe? col row)
      (let ((last-col k) (last-row (car position)))
        (and (not (= last-row row))
             (not (= (abs (- last-row row))
                     (abs (- last-col col)))))))
    (cond ((null? rest-rows) true)
          ((queen-safe? queen-count (car rest-rows))
             (queens-safe? (- queen-count 1) (cdr rest-rows)))
          (else false)))
  (queens-safe? (- k 1) (cdr position)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)
