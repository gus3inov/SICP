(define (tree-map mapper tree)
    (map (lambda (sub-tree)
      (if (pair? sub-tree)
        (square-tree sub-tree)
        (mapper sub-tree))) tree))

(define (square-tree tree) (tree-map square tree))