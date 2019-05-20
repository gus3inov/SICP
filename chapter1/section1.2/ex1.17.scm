(define (fast-* a b)
   (cond ((= b 0) 0) 
        ((= b 1) a) 
        ((even? b) (double (fast-* a (halve b)))) 
        (else (+ a (fast-* a (- b 1))))))

(fast-* 2 4)