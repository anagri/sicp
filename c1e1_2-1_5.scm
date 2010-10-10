;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname first) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
;exercise 1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

;exercise 1.3
(define (square a) (* a a))

(define (sol a b c)(cond ((and (> a b) (> b c)) (+ (square a) (square b)))
                           ((and (> b a) (> c a)) (+ (square b) (square c)))
                           (else (+ (square a) (square c)))
                           ))

;exercise 1.4
(define (a-plus-abs-b a b) ((if (> b 0) + -) a b))
; if condition returns the operator to be applied

;exercise 1.5
;(define (p) (p))

;(define (test x y)
;  (if (= x 0)
;      0
;      y))
; will go into infinite recursion if normal order
; will return 0 if applicative order
