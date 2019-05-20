; Для операции:
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Процесс с помощью аппликативного порядка вычисления будет выглядеть так

(gcd 206 40)
(gcd 40 (remainder 206 40))

(gcd 40 6)
(gcd 6 (remainder 40 6))

(gcd 6 4)
(gcd 4 (remainder 6 4))

(gcd 4 2)
(gcd 2 (remainder 4 2))

(gcd 2 0)
(if (= 0 0)
    2)
; Value: 2

; В итоге операция remainder выполняется 4 раза.

; В случае с нормальным порядком вычисления, произойдет полная подстановка аргументов,
; а затем редукция

(if (= 0 
       0) 
    (remainder (remainder 206 
                          40) 
               (remainder 40 
                          (remainder 206 
                                     40))) 
    (gcd (remainder (remainder 206 
                               40) 
                    (remainder 40 
                               (remainder 206 
                                          40))) 
         (remainder (remainder 40 
                               (remainder 206 
                                          40)) 
                    (remainder (remainder 206 
                                          40) 
                               (remainder 40 
                                          (remainder 206 
                                                     40)))))) 
; 14

(remainder (remainder 206 
                      40) 
           (remainder 40 
                      (remainder 206 
                                 40)))

; 14+4=18

; В случае с нормальным порядком вычисления операция remainder выполняется 18 раз