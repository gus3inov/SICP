(car ’’abracadabra)

;; Т.к ` - это аналог вызова процедура quote, то `` - это (qoute (qoute ...))
;; Соответственно, (car ’’abracadabra) - (car (quote (quote abracadabra)))
;; Т.к первый вызов процедуры quote закавычит (quote abracadabra), то и car соответственно вернет quote
