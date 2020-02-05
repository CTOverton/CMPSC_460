#lang racket
; ----------------------------------------
; [ Example 1 ]
(define (square x) (* x x))

(define (diff x expr)       
  (cond 
    [(or (number? expr) (symbol? expr)) (if (eq? expr x) 1 0)]

    [(eq? (car expr) '+) (list '+ (diff x (cadr expr)) (diff x (caddr expr)))]
    [(eq? (car expr) '-) (list '- (diff x (cadr expr)) (diff x (caddr expr)))]
    [(eq? (car expr) '*) (list 
                            '+ 
                            (list 
                              '* 
                              (cadr expr)
                              (diff x (caddr expr))
                            )
                            (list 
                              '* 
                              (caddr expr)
                              (diff x (cadr expr))
                            )
                          )
    ]
    [(eq? (car expr) '/) (list
                            '/
                            (list 
                              '- 
                              (list 
                                '* 
                                (caddr expr)
                                (diff x (cadr expr))
                              )
                              (list 
                                '* 
                                (cadr expr)
                                (diff x (caddr expr))
                              )
                            )
                            (square (caddr expr))
                          )
    ]
  )
)

display(diff 'x '(+ (* 2 x) 1))
; ----------------------------------------
; [ Example 2 ]

