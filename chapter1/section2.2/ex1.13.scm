;;; Exercise 1.13
;; =============

;; Proof was checked in js

;; const fib = n => n <= 1 ? n : fib(n - 1) + fib(n - 2)

;; const integerFib = (n) => {
;; 	const phi = (1 + Math.sqrt(5)) / 2;
;; 	const phi2 = (1 - Math.sqrt(5)) / 2;
;; 	return Math.round((Math.pow(phi, n) - Math.pow(phi2, n)) / Math.sqrt(5));
;; }

;; fib(7) === integerFib(7);
;; true
;; fib(8) === integerFib(8);
;; true

; Для этого покажем две вещи:

; Fib(n) = (φn-ψn)/√5, где ψ=(1-√5)/2;
; (φn-ψn)/√5 – ближайшее целое число к φn/√5.
; Приступим к первой части доказательства.

; В первую очередь отметим, что

; φ² = ((1+√5)/2)² = (1+2√5+5)/4 = (3+√5)/2 = 1+(1+√5)/2 = 1+φ,
; ψ² = ((1-√5)/2)² = (1-2√5+5)/4 = (3-√5)/2 = 1+(1-√5)/2 = 1+ψ.

; Далее проведем доказательство по индукции.
; Проверим базу индукции для n=0 и n=1:

; Fib(0) = 0 = (1-1)/√5 = (φ0-ψ0)/√5,
; Fib(1) = 1 = √5/√5 = ((1+√5)/2-(1-√5)/2)/√5 = (φ¹-ψ¹)/√5.

; Теперь предположим, что Fib(k) = (φk-ψk)/√5 для всех k от 0 до n и докажем это равенство при k=n+1.

; Fib(n+1) = Fib(n) + Fib(n-1) = (φn-ψn)/√5 + (φn-1-ψn-1)/√5 = [φn-1(φ+1) – ψn-1(ψ+1) ]/√5 = (φn-1φ² – ψn-1ψ²)/√5 = (φn+1 – ψn+1)/√5.

; Тем самым согласно принципу математической индукции Fib(n) = (φn-ψn)/√5 для всех целых неотрицательных n. Следовательно первая часть доказательства завершена.

; Перейдем ко второй части доказательства, а именно докажем, что (φn-ψn)/√5 – ближайшее целое число к φn/√5. Сначала отметим, что (φn-ψn)/√5 является целым числом, так как равно числу Фибоначчи (согласно предыдущей части). Для того, чтобы оно было ближайшим целым к φn/√5, достаточно, чтобы |ψn|/√5 было всегда меньше ½. Покажем это, вновь воспользовавшись методом математической индукции.

; База индукции. Проверим, что |ψ0/√5| < ½:

; |ψ0/√5| = 1/√5 < 1/2 (так как √5>2).

; Теперь в предположении, что |ψn/√5| < ½ покажем, что |ψn+1/√5| < ½:

; |ψn+1/√5| = |ψψn/√5| = |(1-√5)/2| * |ψn/√5|.

; Оценим каждый из сомножителей сверху:

; 1) 2 < √5 < 3 => -2 > -√5 > -3 => -1 > 1-√5 > -2 => -1/2 > (1-√5)/2 > -1 => |(1-√5)/2| < 1;

; 2) |ψn/√5| < 1/2 по предположению матиндукции.

; Но тогда произведение сомножителей можно оценить сверху произведением их верхних оценок, то есть

; |ψn+1/√5| = |(1-√5)/2| * |ψn/√5| < 1*½ = ½,

; что и требовалось доказать.

; Таким образом вторая часть, а с ней и все доказательство закончены.

; Очень полезное упражнение, демонстрирующее мощь метода математической индукции в применении к задачам теории чисел.

;; ref - http://sicp.sergeykhenkin.com/2007/08/20/sicp-exercise-solution-1-13/