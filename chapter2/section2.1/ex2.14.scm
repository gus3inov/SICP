(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
      (div-interval one
        (add-interval (div-interval one r1)
                      (div-interval one r2)))))

; Возьмем два интервала A и B в форме center/percent

; Acp = [400, 3]
; Bcp = [400, 6]

; Вычислим два интервала по каждой формуле

; Par1(A, B) = (174.5071770334928 . 228.64921465968587)
; Par2(A, B) = (190.95287958115185 . 208.95693779904306)

; Acp = [100, 1]

; Par1(A, A) = (48.51980198019802 . 51.52020202020203)
; Par2(A, A) = (49.49999999999999 . 50.5)

; Исходя из этих результатов, можно сказать что две формулы, дают разные результаты
; И вторая формула дает более точный интервал
