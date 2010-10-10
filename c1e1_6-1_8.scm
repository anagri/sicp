;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname c1e1_6-1_) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))
; exercise 1.6
; alyssa's program to compute square root goes into infinite loop, since new-if needs to evaluate both if and else condition, of which the latter again calls new-if
; hence, new-if makes the program go into infinite loop

(define (good-enough? guess a) (< (abs (- (sqr guess) a)) 0.001))
(define (improve guess a) (average guess (/ a guess)))
(define (average a b) (/ (+ a b) 2))
(define (square-root-iter guess a) (if (good-enough? guess a)
                                       guess
                                       (square-root-iter (improve guess a) a)))
(define (square-root a) (square-root-iter 1 a))

; due to limitation of system in multiplying floating numbers, the above solution does not give so accurate result

(define (improved-good-enough? old-guess guess) (< (abs (- guess old-guess)) 0.001))

(define (improved-square-root-iter old-guess guess a) (if (improved-good-enough? old-guess guess)
                                               guess
                                               (improved-square-root-iter guess (improve guess a) a)))

(define (improved-square-root a) (improved-square-root-iter 0 1 a))

; the below output is sufficient to explain why the improved-square-root is better than the former solution
(square-root 10000)
(improved-square-root 10000)


; exercise 1.8

(define (improve-cube-root-guess guess a) (/ (+ (/ a (sqr guess)) (* 2 guess)) 3))

(define (cube-root-iter old-guess guess a) (if (improved-good-enough? old-guess guess)
                                               guess
                                               (cube-root-iter guess (improve-cube-root-guess guess a) a)))

(define (cube-root a) (cube-root-iter 0 1 a))

(cube-root 27)