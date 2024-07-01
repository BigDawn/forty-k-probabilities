;;;; With an aim to expanding to other rulesets, I should look to 
;;;; creating a build system that spits out apps per game

(defun load-which-game (game-name)
  "Verify game-name has a folder. Use folder marked by game name."
  )

(defparameter *units-csv* (cl-csv:read-csv #P"forty-k/units.csv"))
(defparameter *units* (make-hash-table :test 'EQUAL))
(hash-csv (pop *units-csv*) *units-csv* "Model" *units*)

(defparameter *weapons-csv* (cl-csv:read-csv #P"forty-k/weapons.csv"))
(defparameter *weapons* (make-hash-table :test 'EQUAL))
(hash-csv (pop *weapons-csv*)
		  *weapons-csv* 
		  '("Model" "Name")
		  *weapons*)

