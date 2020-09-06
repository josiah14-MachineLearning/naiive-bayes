(import [numpy :as np])
(import [pandas :as pd])
(import [matplotlib :as mpl])
(import [matplotlib.pyplot :as plt])
(import [helpers [*]])
(require [helpers [*]])

(.use mpl "TkAgg")

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
(print "Here's some metrics on the raw Pregnancies values")
(print (describe-column pima-df "Pregnancies"))
(print)
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

(setv pima-no-skin-thickness-df
      (.sort_values (filter-low-values pima-df "SkinThickness" 5.0)
                    :by "SkinThickness"
                    :ascending False))
(print pima-no-skin-thickness-df)
(print "Percentage of SkinThickness values that were 0")
(print
  (/ (len (. pima-no-skin-thickness-df index))
     (/ total-number-of-records 100)))

(setv pima-no-insulin-df
      (.sort_values (filter-low-values pima-df "Insulin" 10.0)
                    :by "Insulin"
                    :ascending False))
(print pima-no-insulin-df)
(print "Percentage of Insulin values that were 0")
(print (/ (len (. pima-no-insulin-df index))
          (/ total-number-of-records 100)))

(setv pima-no-bmi-df
      (.sort_values (filter-low-values pima-df "BMI" 5.0)
                    :by "BMI"
                    :ascending False))
(print pima-no-bmi-df)
(print "Percentage of BMI values that were 0")
(print (/ (len (. pima-no-bmi-df index))
          (/ total-number-of-records 100)))

(setv pima-no-diabetes-pedigree-function-df
      (.sort_values (filter-low-values pima-df "DiabetesPedigreeFunction" 0.05)
                    :by "DiabetesPedigreeFunction"
                    :ascending False))
(print pima-no-diabetes-pedigree-function-df)
(print "Percentage of DiabetesPedigreeFunction values that were 0")
(print (/ (len (. pima-no-diabetes-pedigree-function-df index))
          (/ total-number-of-records 100)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Statistics minus 0/null values
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(print)
(print "Column statistics which account for null/invalid values")
(print)
(print (+ "Pregnancies Column statistics - raw form used because 0s are "
          "significant: "))
(print (describe-column pima-df "Pregnancies"))
(print (+ "Median Pregnancies: "
          (str (.median
                 #s((. pima-df loc) : "Pregnancies")))))

(setv rows-with-glucose-value
      (. (.get (~ (.isin pima-df pima-no-glucose-df))
               "Glucose")
         values))
(setv pima-glucose-df
      #s((. pima-df loc) rows-with-glucose-value))
(print)
(print "Glucose Column statistics when nulls excluded: ")
(print (describe-column pima-glucose-df "Glucose"))
(print (+ "Median Glucose: "
          (str (.median
                 #s((. pima-glucose-df loc) : "Glucose")))))

(setv rows-with-diastolic-bp
      (. (.get (~ (.isin pima-df pima-no-bp-df))
               "DiastolicBloodPressure")
         values))
(setv pima-bp-df
      #s((. pima-df loc) rows-with-diastolic-bp))
(print)
(print "DiastolicBloodPressure statistics when nulls excluded: ")
(print (describe-column pima-bp-df "DiastolicBloodPressure"))
(print (+ "Median DiastolicBloodPressure: "
          (str (.median
                 #s((. pima-bp-df loc) : "DiastolicBloodPressure")))))

(setv rows-with-skin-thinkness
      (. (.get (~ (.isin pima-df pima-no-skin-thickness-df))
               "SkinThickness")
         values))
(setv pima-skin-thickness-df
      #s((. pima-df loc) rows-with-skin-thinkness))
(print)
(print "SkinThickness statistics when nulls excluded: ")
(print (describe-column pima-skin-thickness-df "SkinThickness"))
(print (+ "Median SkinThickness: "
          (str (.median
                 #s((. pima-skin-thickness-df loc) : "SkinThickness")))))

(setv rows-with-insulin-value
      (. (.get (~ (.isin pima-df pima-no-insulin-df))
               "Insulin")
         values))
(setv pima-insulin-df
      #s((. pima-df loc) rows-with-insulin-value))
(print)
(print "Insulin Column statistics when nulls excluded: ")
(print (describe-column pima-insulin-df "Insulin"))
(print (+ "Median Insulin: "
          (str (.median
                 #s((. pima-insulin-df loc) : "Insulin")))))

(setv rows-with-bmi
      (. (.get (~ (.isin pima-df pima-no-bmi-df))
               "BMI")
         values))
(setv pima-bmi-df
      #s((. pima-df loc) rows-with-bmi))
(print)
(print "BMI Column statistics when nulls excluded: ")
(print (describe-column pima-bmi-df "BMI"))
(print (+ "Median BMI: "
          (str (.median
                 #s((. pima-bmi-df loc) : "BMI")))))

(print)
(print (+ "DiabetesPedigreeFunction Column statistics - raw form used because "
          "there weren't any null/invalid values."))
(print (describe-column pima-df "DiabetesPedigreeFunction"))
(print (+ "Median DiabetesPedigreeFunction: "
          (str (.median
                 #s((. pima-df loc) : "DiabetesPedigreeFunction")))))

(print)
(print (+ "Age Column statistics - raw form used because "
          "there weren't any null/invalid values."))
(print (describe-column pima-df "Age"))
(print (+ "Median Age: "
          (str (.median
                 #s((. pima-df loc) : "Age")))))

(setv pima-age-class-df
      (.count #s((.groupby pima-df ["Age" "Cassification"] :as-index True)
                 "Pregnancies")))

(.plot.bar pima-age-class-df)
;; (.plot.bar
;;   (.concat pd
;;            [#s((. pima-age-class-df loc) (= (.get pima-age-class-df "Cassification") 0))
;;             #s((. pima-age-class-df loc) (= (.get pima-age-class-df "Cassification") 1))]
;;            :axis 1))
(.show plt)

(setv bins [0 6 12 18 24 30 36 42 48 54 60 66 72 78 84])
(setv labels ["0-6" "7-12" "13-18" "19-24" "25-30" "31-36" "37-42" "43-48" "49-54" "55-60" "61-66" "67-72" "73-78" "79-84"])
(setv #s((. pima-df loc) : "age-binned-half-std")
      (.cut pd (.get pima-df "Age") bins :labels labels))
(setv pima-age-groupings-df
      (.count #s((.groupby pima-df ["age-binned-half-std"] :as-index False) "Age")))
(print pima-age-groupings-df)
(.plot pima-age-groupings-df :kind "bar")
(.show plt)

(setv bins [0 12 24 36 48 60 72 84])
(setv labels ["0-12" "13-24" "25-36" "37-48" "49-60" "61-72" "73-84"])
(setv #s((. pima-df loc) : "age-binned-one-std")
      (.cut pd (.get pima-df "Age") bins :labels labels))
(setv pima-age-groupings-df
      (.count #s((.groupby pima-df ["age-binned-one-std"] :as-index False) "Age")))
(.plot pima-age-groupings-df :kind "bar")
(.show plt)

(setv bins [0 12 18 24 30 42 54 66 84])
(setv labels ["0-12" "13-18" "19-24" "24-30" "31-42" "43-54" "55-66" "67-84"])
(setv #s((. pima-df loc) : "age-binned-hybrid-std")
      (.cut pd (.get pima-df "Age") bins :labels labels))
(setv pima-age-groupings-df
      (.count #s((.groupby pima-df ["age-binned-hybrid-std"] :as-index False) "Age")))
(.plot pima-age-groupings-df :kind "bar")
(.show plt)
;; (print (.median
;;          #s((. pima-df loc) : "Age")))
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
