; Итак, трансформация Tpq переводит пару (a, b) в пару (bq+aq+ap, bp+aq), что можно записать как

; Tpq: (a, b) <- (bq+aq+ap, bp+aq) или Tpq(a, b) = (bq+aq+ap, bp+aq).

; Вычислим Tpq²:

; Tpq²(a, b) = Tpq(Tpq(a, b)) = Tpq(bq+aq+ap, bp+aq) =

; = ([bp+aq]q+[bq+aq+ap]q+[bq+aq+ap]p, [bp+aq]p+[bq+aq+ap]q) =

; = (b[2pq+q²]+a[2pq+q²]+a[p²+q²], b[p²+q²]+a[2pq+q²]) =

; = (bq’+aq’+ap’, bp’+aq’) = Tp’q’(a, b),

; где p’ = p²+q², q’ = 2pq+q².


; Основываясь на результатах первой части и проанализировав код процедуры fib, приходим к выводу,
;что в пропущенных строках происходит скачок через шаг за счет использования факта, что Tpq²=Tp’q’.
;Пропущенные строки, таким образом, должны обеспечивать трансформацию (p,  q) <- (p’, q’)  и имеют вид:

; (+ (square p) (square q))

; (+ (* 2 p q) (square q))

(define (square x)( * x x))

(define (fib n)
    (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
    (cond ((= count 0) b)
        ((even? count)
            (fib-iter a
                    b
                    (+ (square p) (square q))
                    (+ (* 2 p q) (square q))
                    (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))