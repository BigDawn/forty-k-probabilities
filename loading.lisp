(defparameter *units-csv* (cl-csv:read-csv #P"units.csv"))
(defparameter *units* (make-hash-table :test 'EQUAL))
(hash-csv-vectors (pop *units-csv*) *units-csv* "Model" *units*)

