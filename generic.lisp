;;;; Helper functions that are used by program for various games etc.

(defun d6-probability (dice-roll)
  ;; A dice-roll of 3 means a 3+ roll, so 4/6
  (cond 
    ((> dice-roll 6) 0)
    ((<= dice-roll 0) 0)
    (t (/ 
         (- 6 (- dice-roll 1)) 
         6))))

