#|
Authors: David Ogunbanjo & Denis Moroz
Description: This file contains the answers to the ASN3 assignment questions.
Date: 3/21/2026
|#

;; Question 1

#| Calculate the Discrete Fourier Transform on a given list of real numbers. The only parameter 
this function is going to receive is a list of real numbers. Moreover, this function must return another 
list of (mostly) complex numbers from the result of the DFT formula. 
(LLM Euler's Formula, cos and sin) |#

(defun DiscreteTransform (numbers)

    
    (let ((f_u_list '()) (N (length numbers)) (i (sqrt -1)))  ;; f(u) store the return list, N: length of the list, i: imaginary numbers
        (let ((u 0))  ;; create the variable u for the outer loop
            (do    ;; this is for the calculation of f(u) list
                ()  ;; nothing
                ((= u N) (reverse f_u_list))  ;; end cond
                (progn  ;; outer loop body
                    ;;(print u) 
                    
                    (let ((x 0) (total 0))  ;; for each iteration total should be 0 at the start
                        (do  ;; inner loop to calculate the each summation
                            ()
                            ((= x N) t)  ;; when x reaches the max stop (return true)
                            (progn ;; inner loop body
                                ;; perform the calculations
                                (let ((A 0) (B 0) (C 0) (D 0) (E 0) (F 0))  ;; declare the variable before initalizing it
                                    (setq A (* -2 i pi u x)) 
                                    (setq B (/ A N))
                                    (setq C (exp B))
                                    (setq D (* (nth x numbers) C))
                                    (setq E (/ 1 N))
                                    (setq F (* E D))

                                    (setq total (+ total F))  ;; add to total

                                )
                                
                                ;; done next flow
                                (setq x (+ x 1))  ;; increment x
                            )
                           
                        )

                        (push total f_u_list)  ;; add the result to the f(u) list
                    )

                    ;; done next flow
                    (setq u (+ u 1))    
                )
            )
        )
    )

)
(DiscreteTransform '(1 2 3 4 5))


#|            
 |#

;; Question 2
#| Calculate the Inverse Discrete Fourier Transform on a given list of (mostly) complex numbers. 
The only parameter to this function is a list of numbers representing data in the frequency domain.
|#
;; paper work logic that I will translate over: make a loop for every x, and inside it make another loop for every u. 
        ;; Each time, calculate the inverse exponential part, then multiply by the value in the list, keep adding it to the total, and when done, store the rounded real part into the result list. 
;; Sources used: Chapter 10 slides: 20, 21. 23, 30, 46, 53, 54. 55, 69, 70, 71 ,76, 94, 95, 96
(defun InverseDiscreteTransform (numbers)
    (let ((x_list '()) (N (length numbers)) (i (sqrt -1))) ;;store the final value into list
         (let ((x 0)) ;;use x as the outer loop
              (do
                  ()
                  ((= x N) (reverse x_list));;return list when x reachs n
                  (progn
                      (let ((u 0) (total 0));;use u for the inner loop & start the total at 0
                           (do
                               ()
                               ((= u N) t) ;;once u reaches n stop the inner loop
                               (progn
                                   (let ((A 0) (B 0) (C 0) (D 0) (E 0))
                                        (setq A (* 2 i pi u x)) ;;top part
                                        (setq B (/ A N)) ;; divide by n
                                        (setq C (exp B)) ;; e^fraction
                                        (setq D (* (nth u numbers) C)) ;;milpilty the e exp by F(u)
                                        (setq E (+ total D));; add to total
                                        (setq total E) ;; save it
                                        )
                                        
                                   (setq u (+ u 1))
                                   )
                               )
                           (push (round (realpart total)) x_list);; use function(realpart Y) to avoid round error.
                           )
                      (setq x (+ x 1))
                      )
                  )
              )
         )
    )
)
;; Test here: 
(InverseDiscreteTransform (DiscreteTransform '(1 2 3 4 5))) ;; test this once you change what u wanted
