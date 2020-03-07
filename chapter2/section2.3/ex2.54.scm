(define (equal? lista listb)
  (cond 
        ((and (null? lista) (null? listb)) #t)
        ((and (number? lista) (number? listb) (= lista listb)) #t)
        ((and (symbol? lista) (symbol? listb) (eq? lista listb)) #t)
        ((and
          (and (pair? lista) (pair? listb))
          (and (equal? (car lista) (car listb))
               (equal? (cdr lista) (cdr listb)))) #t)
        (else #f)))
