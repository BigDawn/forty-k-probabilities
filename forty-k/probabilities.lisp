
;;; Return probability as a decimal

(defun hit-probability (shooter)
  ;; TODO getShooterHitSkillByKeyword
  ;; TODO CalculateDecimalProbabilityOnD6
  (d6-probability (stat-find "Ballistic-Skill" shooter))
  )

(defun wound-probability (shooter enemy)
  )

(defun no-save-probability (shooter enemy)
  )

