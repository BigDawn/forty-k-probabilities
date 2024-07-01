;;; Helper functions - not tests!
(defun get-vector-keys (vec)
  (map 'list #'first vec))

;;; Test csv fields are unique after hashing
(defun test-unique-hash-fields-weapons (weapons)
  ;; TODO foreach vector with keys as a hash in table, 
  ;; check no field names repeat
  )

