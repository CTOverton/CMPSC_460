; ----------------------------------------
; [ Example 1 ]

(define (gcd u v) 
  (if (= v 0) 
    u
    (gcd v (mod u v))
  )
)

(display "Example 1 (gcd 12 4): ")
(display (gcd 12 4))
(newline)
; ----------------------------------------
; [ Example 2 ]

(define (power a b) 
  (let helper [(b b) (temp 1)]
    (if (= b 0)
      temp
      (helper (- b 1) (* temp a))
    )
  )
)

(display "Example 2 (power 2 2): ")
(display (power 2 3))
(newline)
; ----------------------------------------
; [ Example 3 ]

; ----------------------------------------
; [ Example 4 ]

(define (getNth l n) 
  (if (= n 0)
    (car l)
    (getNth (cdr l) (- n 1))
  )
)

(display "Example 4 (getNth (list 1 2 3 4 5) 2): ")
(display (getNth (list 1 2 3 4 5) 2))
(newline)
; ----------------------------------------
; [ Example 5 ]

(define (getMax l) 
  (let helper [(l l) (max (car l))]
    (if (= (length l) 0)
        max
        (if (< max (car l))
          (helper (cdr l) (car l))
          (helper (cdr l) max)
        )
    )
  )
)

(display "Example 5 (getMax (list 1 3 2 7 5)): ")
(define x (list 1 3 2 7 5))
(display (getMax x))
(newline)
; ----------------------------------------
; [ Example 6 ]

; ----------------------------------------
; [ Example 7 ]

; ----------------------------------------
; [ Example 8 ]

; ----------------------------------------
