(import [numpy :as np])
(import [pandas :as pd])
(import [helpers [*]])
(require [helpers [*]])

(setv pima-df
      (pd.read_csv
        "http://nrvis.com/data/mldata/pima-indians-diabetes.csv"
        :header None
        :names ["Pregnancies" "Glucose" "DiastolicBloodPressure" "SkinThickness" "Insulin" "BMI" "DiabetesPedigreeFunction" "Age" "Cassification"]))

(print "Here is what the raw data looks like...")
(print pima-df)
(print)

(setv total-number-of-records
      (len (. pima-df index)))

(defn describe-column [df
                       column-name]
  """
  Run the `describe` function on a column of the provided dataframe.
  """
  (.describe (.get df column-name)))

;; Column-level Metrics
(print "Here's some metrics on the raw Glucose values")
(print (describe-column pima-df "Glucose"))
(print)
(print "Here's some metrics on the raw Diastolic Blood Pressure values")
(print (describe-column pima-df "DiastolicBloodPressure"))
(print)
(print "Here's some metrics on the raw Skin Thickness values")
(print (describe-column pima-df "SkinThickness"))
(print)
(print "Here's some metrics on the raw Insulin values")
(print (describe-column pima-df "Insulin"))
(print)
(print "Here's some metrics on the raw BMI values")
(print (describe-column pima-df "BMI"))
(print)
(print "Here's some metrics on the raw Diabetes Pedigree Function")
(print (describe-column pima-df "DiabetesPedigreeFunction"))
(print)
(print "Here's some metrics on the raw Age")
(print (describe-column pima-df "Age"))

(defn filter-low-values [df column-name lower-limit]
  #s((. df loc)
     (< (.get df column-name) lower-limit)))

(setv pima-no-glucose-df
      (.sort_values (filter-low-values pima-df "Glucose" 30.0)
                    :by "Glucose"
                    :ascending False))
(print pima-no-glucose-df)
(print "Percentage of Glucose values that were 0")
(print
  (/ (len (. pima-no-glucose-df index))
     (/ total-number-of-records 100)))

(setv pima-no-bp-df
      (.sort_values (filter-low-values pima-df "DiastolicBloodPressure" 10.0)
                    :by "DiastolicBloodPressure"
                    :ascending False))
(print pima-no-bp-df)
(print "Percentage of DiastolicBloodPressure values that were 0")
(print
  (/ (len (. pima-no-bp-df index))
     (/ total-number-of-records 100)))

(print
  (.sort_values #s((. pima-df loc)
                   (< (.get pima-df "SkinThickness") 5.0))
                :by "SkinThickness"
                :ascending False))
(print "Percentage of SkinThickness values that were 0")
(print
  (/ (len (. #s((. pima-df loc)
                (< (.get pima-df "SkinThickness") 5.0))
             index))
     (/ total-number-of-records 100)))

(print (.sort_values #s((. pima-df loc)
                        (< (.get pima-df "Insulin") 10.0))
                     :by "Insulin"
                     :ascending False))
(print "Percentage of Insulin values that were 0")
(print (/ (len (. #s((. pima-df loc)
                     (< (.get pima-df "Insulin") 10.0))
                  index))
          (/ total-number-of-records 100)))

(print
  (.sort_values #s((. pima-df loc)
                   (< (.get pima-df "BMI") 5.0))
                :by "BMI"
                :ascending False))
(print "Percentage of BMI values that were 0")
(print (/ (len (. #s((. pima-df loc)
                     (< (.get pima-df "BMI") 10.0))
                  index))
          (/ total-number-of-records 100)))

(print
  (.sort_values #s((. pima-df loc)
                   (< (.get pima-df "DiabetesPedigreeFunction") 5.0))
                :by "DiabetesPedigreeFunction"
                :ascending False))
(print "Percentage of DiabetesPedigreeFunction values that were 0")
(print (/ (len (. #s((. pima-df loc)
                     (< (.get pima-df "DiabetesPedigreeFunction") 0.01))
                  index))
          (/ total-number-of-records 100)))

;; If using median to replace 0's which represent NULLs, you want to use the
;; median of the training set, not the test set, and also be sure to exclude
;; 0 values in the median/mean calculation.
;;
;; Want to make sure if you calculate the median on the entire dataset, you want
;; to make sure that the hold-out test set is small enough that the rest of the
;; data available for calculating the mean over the whole dataset is a
;; statistically significant sample.  Hold One Out approach works well, here, in
;; some cases.

;; - Next week - actually write naiive bayes function.
;; - Future, SGD for adjusting bin sizes?  Important to avoid overfitting, discuss
;; strategies for that.


;; Histograms

;; (setv total-records (len spam-df.index))

;; (setv frequencies-df
;;       (.count
;;         (.groupby spam-df ["SuspiciousWords" "SpamClass"])))

;; (print total-records)
;; (print #s((. (.get frequencies-df "SpamId") loc) (, False "ham")))
