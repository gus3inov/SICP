;; More correct solution with token stream from Eli Benderski https://eli.thegreenplace.net/2007/08/30/sicp-sections-231-232/

;; 2.58 - a

(define (sum? x)
  (and (pair? x) (eq? (cadr x) `+)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list a1 `+ a2))))

(define (addend s) (car s))

(define (augend s)
  (if (null? (cdddr s))  
      (caddr s)            
      (make-sum (addend (cddr s))
                (augend (cddr s)))))

(define (product? x)
  (and (pair? x) (eq? (cadr x) `*)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 `* m2))))

(define (multiplier p) (car p))

(define (multiplicand p)                          
  (if (null? (cdddr p))                              
      (caddr p)                                        
      (make-product (multiplier (cddr p))     
                    (multiplicand (cddr p)))))

(define (make-subtract a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (- a1 a2))
        (else (list a1 `- a2))))

(deriv `(x + (3 * (x + (y + 2)))) `x)

;; 2.58 - b 

(define (augend s)
  (cond ((null? (cdddr s)) (caddr s))
        ((product? (cddr s)) (make-product (multiplier (cddr s)) (multiplicand (cddr s))))
        (else (make-sum (addend (cddr s))
                        (augend (cddr s))))))

(define (multiplicand p)
  (cond ((null? (cdddr p)) (caddr p))
        ((sum? (cddr p)) (make-sum (addend (cddr p)) (augend (cddr p))))
        (else (make-product (multiplier (cddr p))     
                            (multiplicand (cddr p))))))

(deriv `(x + 3 * (x + y + 2)) `x)
