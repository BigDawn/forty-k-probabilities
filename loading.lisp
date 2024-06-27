
(defun stat-find (str-key data-vector)
  (second (find str-key data-vector :test 'equal :key #'first)))

;; Vectorize CSV row option 1
(defun keyword-vect-csv-row (csv-row headers return-vector)
  (let ((cnt 0))
    (dolist (stat csv-row)
      (vector-push-extend 
	(list (elt headers cnt) stat) 
	return-vector)
      (incf cnt)))
  return-vector)

;; Vectorize CSV row option 2 (next two functions)
(defun add-csv-keywords (headers csv)
  (mapcar #'(lambda (item)
              (list
               (elt headers (position item csv :test 'equal))
               item))
          csv))

(defun vectorize-list (my-list)
  (coerce my-list 'vector))

;;; Make a datasheet vector out of each csv row and add it to the hash-table with a hash made
;;; from the value at key-name in the datasheet e.g. model name is the hash for units
(defun hash-csv-vectors (headers csv key-name hash-tab)
  (mapcar 
    #'(lambda (item) 
	     (let ((datasheet (vectorize-list (add-csv-keywords headers item))))
	       (setf 
	         (gethash 
                   (stat-find key-name datasheet) 
		   hash-tab)
		 datasheet)))
    csv))

(defparameter *units-csv* (cl-csv:read-csv #P"units.csv"))
(defparameter *units* (make-hash-table :test 'EQUAL))
(hash-csv-vectors (pop *units-csv*) *units-csv* "Model" *units*)

