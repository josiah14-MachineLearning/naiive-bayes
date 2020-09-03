Here is what the raw data looks like...
     Pregnancies  Glucose  ...  Age  Cassification
0              6      148  ...   50              1
1              1       85  ...   31              0
2              8      183  ...   32              1
3              1       89  ...   21              0
4              0      137  ...   33              1
..           ...      ...  ...  ...            ...
763           10      101  ...   63              0
764            2      122  ...   27              0
765            5      121  ...   30              0
766            1      126  ...   47              1
767            1       93  ...   23              0

[768 rows x 9 columns]

Here's some metrics on the raw Glucose values
count    768.000000
mean     120.894531
std       31.972618
min        0.000000
25%       99.000000
50%      117.000000
75%      140.250000
max      199.000000
Name: Glucose, dtype: float64

Here's some metrics on the raw Diastolic Blood Pressure values
count    768.000000
mean      69.105469
std       19.355807
min        0.000000
25%       62.000000
50%       72.000000
75%       80.000000
max      122.000000
Name: DiastolicBloodPressure, dtype: float64

Here's some metrics on the raw Skin Thickness values
count    768.000000
mean      20.536458
std       15.952218
min        0.000000
25%        0.000000
50%       23.000000
75%       32.000000
max       99.000000
Name: SkinThickness, dtype: float64

Here's some metrics on the raw Insulin values
count    768.000000
mean      79.799479
std      115.244002
min        0.000000
25%        0.000000
50%       30.500000
75%      127.250000
max      846.000000
Name: Insulin, dtype: float64

Here's some metrics on the raw BMI values
count    768.000000
mean      31.992578
std        7.884160
min        0.000000
25%       27.300000
50%       32.000000
75%       36.600000
max       67.100000
Name: BMI, dtype: float64

Here's some metrics on the raw Diabetes Pedigree Function
count    768.000000
mean       0.471876
std        0.331329
min        0.078000
25%        0.243750
50%        0.372500
75%        0.626250
max        2.420000
Name: DiabetesPedigreeFunction, dtype: float64

Here's some metrics on the raw Age
count    768.000000
mean      33.240885
std       11.760232
min       21.000000
25%       24.000000
50%       29.000000
75%       41.000000
max       81.000000
Name: Age, dtype: float64
     Pregnancies  Glucose  ...  Age  Cassification
75             1        0  ...   22              0
182            1        0  ...   21              0
342            1        0  ...   22              0
349            5        0  ...   37              1
502            6        0  ...   41              1

[5 rows x 9 columns]
Percentage of Glucose values that were 0
0.6510416666666667
     Pregnancies  Glucose  ...  Age  Cassification
7             10      115  ...   29              0
535            4      132  ...   23              1
453            2      119  ...   72              0
468            8      120  ...   38              1
484            0      145  ...   31              1
494            3       80  ...   22              0
522            6      114  ...   26              0
533            6       91  ...   31              0
589            0       73  ...   25              0
430            2       99  ...   23              0
601            6       96  ...   28              0
604            4      183  ...   36              1
619            0      119  ...   24              1
643            4       90  ...   31              0
697            0       99  ...   22              0
703            2      129  ...   41              0
435            0      141  ...   29              1
426            0       94  ...   25              0
15             7      100  ...   32              1
222            7      119  ...   37              0
49             7      105  ...   24              0
60             2       84  ...   21              0
78             0      131  ...   26              1
81             2       74  ...   22              0
172            2       87  ...   25              0
193           11      135  ...   40              1
261            3      141  ...   27              1
357           13      129  ...   44              1
266            0      138  ...   25              1
269            2      146  ...   28              1
300            0      167  ...   30              1
332            1      180  ...   41              1
336            0      117  ...   44              0
347            3      116  ...   23              0
706           10      115  ...   30              1

[35 rows x 9 columns]
Percentage of DiastolicBloodPressure values that were 0
4.557291666666667
     Pregnancies  Glucose  ...  Age  Cassification
2              8      183  ...   32              1
587            6      103  ...   29              0
505           10       75  ...   38              0
509            8      120  ...   64              0
512            9       91  ...   58              0
..           ...      ...  ...  ...            ...
261            3      141  ...   27              1
264            4      123  ...   35              1
266            0      138  ...   25              1
268            0      102  ...   21              0
766            1      126  ...   47              1

[227 rows x 9 columns]
Percentage of SkinThickness values that were 0
29.557291666666668
     Pregnancies  Glucose  ...  Age  Cassification
0              6      148  ...   50              1
509            8      120  ...   64              0
525            3       87  ...   21              0
524            3      125  ...   24              0
523            9      130  ...   45              1
..           ...      ...  ...  ...            ...
239            0      104  ...   27              0
238            9      164  ...   32              1
237            0      179  ...   23              1
235            4      171  ...   26              1
767            1       93  ...   23              0

[374 rows x 9 columns]
Percentage of Insulin values that were 0
48.69791666666667
     Pregnancies  Glucose  ...  Age  Cassification
9              8      125  ...   54              1
49             7      105  ...   24              0
60             2       84  ...   21              0
81             2       74  ...   22              0
145            0      102  ...   21              0
371            0      118  ...   21              0
426            0       94  ...   25              0
494            3       80  ...   22              0
522            6      114  ...   26              0
684            5      136  ...   69              0
706           10      115  ...   30              1

[11 rows x 9 columns]
Percentage of BMI values that were 0
1.4322916666666667
     Pregnancies  Glucose  ...  Age  Cassification
445            0      180  ...   25              1
228            4      197  ...   31              0
4              0      137  ...   33              1
370            3      173  ...   25              1
45             0      180  ...   25              1
..           ...      ...  ...  ...            ...
135            2      125  ...   31              0
567            6       92  ...   46              0
149            2       90  ...   22              0
180            6       87  ...   32              0
268            0      102  ...   21              0

[768 rows x 9 columns]
Percentage of DiabetesPedigreeFunction values that were 0
0.0
