(define (double n)
  (* n 2))

(define (halve n)
  (/ n 2))

(define (fast-* a b)
 (fast-*-iter a b 1))

(define (fast-*-iter a b c)
   (cond ((= b 0) c) 
        ((= b 1) a) 
        ((even? b) (double (fast-* a (halve b) c))) 
        (else (+ a (fast-* a (- b 1) (+ c a))))))

(fast-* 2 4)