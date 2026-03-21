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
    (print numbers)
    (let ((f_u_list '()) (N (length numbers)) (i (sqrt -1)))  ;; f(u) store the return list, N: length of the list, i: imaginary numbers
        (let ((u 0))  ;; create the variable u for the outer loop
            (do    ;; this is for the calculation of f(u) list
                ()  ;; nothing
                ((= u N) (print f_u_list))  ;; end cond
                (progn  ;; outer loop body
                    ;;(print u) 
                    
                    (let ((x 0) (total 0))
                        (do  ;; inner loop to calculate the each summation
                            ()
                            ((= x N) t)  ;; when x reaches the max stop (return true)
                            (progn ;; inner loop body
                                ;; perform the calculations
                                (let (A B C D E F)  ;; declare the variable before initalizing it
                                    (setq A (* -2 i pi u x)) 
                                    (setq B (/ A N))
                                    (setq C (exp B))
                                    (setq D (* (nth x numbers) C))
                                    (setq E (/ 1 N))
                                    (setq F (* D E))


                                    (setq total (+ total F))  ;; add to total


                                    
                                )
                                
                                ;; done next flow
                                (setq x (+ x 1))
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
(LLM must use Euler's Formula, cos and sin)|#



