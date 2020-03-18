(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum
          (deriv (addend exp) var)
          (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
           (make-product
             (exponent exp)
             (make-exponentiation (base exp)
                                  (make-subtract (exponent exp) 1)))
           (deriv (base exp) var)))
        (else (error "неизвестный тип выражения -- DERIV" exp))))

(define (base s) (cadr s))

(define (exponent s) (caddr s))

(define (exponentiation? x)
    (and pair? x) (eq? (car x) `**))

(define (make-subtract a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (- a1 a2))
        (else (list '- a1 a2))))

(define (power a b) 
  (exp (* b (log a))))

(define (make-exponentiation a1 a2)
    (cond ((=number? a2 0) 1)
          ((=number? a2 1) a1)
          ((and (number? a1) (number? a2)) (power a1 a2))
           (else (list `** a1 a2))))
