;; Vectorize CSV row option 1 - old
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
               (elt headers (position item csv :test 'eq))
               item))
          csv))

(defun vectorize-list (my-list)
  (coerce my-list 'vector))

(defun key-creation (key-name data-vect)
  "Create a keyname for my csv hash tables. Behaviour differs if key-name is string or list."
  (cond
    ((stringp key-name) (stat-find key-name data-vect))
    ((listp key-name) (format nil
			      "~{~A~^ with ~}"
			      (mapcar #'(lambda (x) (stat-find x data-vect)) key-name)))
    (t NIL)))

;;; Make a datasheet vector out of each csv row and add it to the hash-table with a hash made
;;; from the value at key-name in the datasheet e.g. model name is the hash for units
(defun hash-csv-vectors (headers csv key-name hash-tab)
  (mapcar 
    #'(lambda (item) 
	     (let ((datasheet (vectorize-list (add-csv-keywords headers item))))
	       (setf 
	         (gethash 
                   (key-creation key-name datasheet) 
		   hash-tab)
		 datasheet)))
    csv))

(defun stat-find (str-key data-vector)
  (second (find str-key data-vector :test 'equal :key #'first)))

(defun hash-csv (headers csv key-name hash-tab)
  "Error check then alter the provided hash table"
  (cond
    (t (hash-csv-vectors headers csv key-name hash-tab))))

