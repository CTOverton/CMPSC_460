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

(define (init_map) '())

(define (insert_map key value)
  (set! theMap (cons (list key value) theMap))
)

(define (getValWithKey_map map key)
  (if (null? map) "Not found"
      (if (eq? (caar map) key)
          (cdr (car map))
          (getValWithKey_map (cdr map) key)
          )
  )
)

(define (delPairWithKey_map map key cache)
  (if (null? map) "Not found"
      (if (eq? (caar map) key)
          (set! theMap (cons cache (cdr map)))
          (delPairWithKey_map (cdr map) key (cons cache (car map)))
          )
  )
)

(define (length_map map)
  (length map)
)

; ========== [ TEST CASES ] ==========

; 1. Initialize the map
(define theMap (init_map))

; 2. Insert a pair (key, value) into the map
(insert_map 'key1 'value1)
(insert_map 'key2 'value2)
(insert_map 'key3 'value3)
theMap

; 3. Get a value for a given key
(getValWithKey_map theMap 'key2)

; 4. Remove a pair from the map with a given key
(delPairWithKey_map theMap 'key2 '())

; 5. Get the size of the map
(length_map theMap)