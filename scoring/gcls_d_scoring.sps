* GCLS-D Scoring (SPSS).
* Erwartet Items als gcls_01 bis gcls_38 (Werte 1-5).
* Reverse-Items: 3,5,10,31-38,32,33,34,35,36,37,38.
* Reverse (1-5): x_rev = 6 - x.

* --- Reverse scoring: create new variables r01..r38 (copies, with reversals where needed).
DO REPEAT src = gcls_01 gcls_02 gcls_03 gcls_04 gcls_05 gcls_06 gcls_07 gcls_08 gcls_09 gcls_10
              gcls_11 gcls_12 gcls_13 gcls_14 gcls_15 gcls_16 gcls_17 gcls_18 gcls_19 gcls_20
              gcls_21 gcls_22 gcls_23 gcls_24 gcls_25 gcls_26 gcls_27 gcls_28 gcls_29 gcls_30
              gcls_31 gcls_32 gcls_33 gcls_34 gcls_35 gcls_36 gcls_37 gcls_38
         /dst = r01 r02 r03 r04 r05 r06 r07 r08 r09 r10
              r11 r12 r13 r14 r15 r16 r17 r18 r19 r20
              r21 r22 r23 r24 r25 r26 r27 r28 r29 r30
              r31 r32 r33 r34 r35 r36 r37 r38.
  COMPUTE dst = src.
END REPEAT.
EXECUTE.

* Reverse items.
IF (NOT MISSING(r03)) r03 = 6 - r03.
IF (NOT MISSING(r05)) r05 = 6 - r05.
IF (NOT MISSING(r10)) r10 = 6 - r10.
IF (NOT MISSING(r31)) r31 = 6 - r31.
IF (NOT MISSING(r32)) r32 = 6 - r32.
IF (NOT MISSING(r33)) r33 = 6 - r33.
IF (NOT MISSING(r34)) r34 = 6 - r34.
IF (NOT MISSING(r35)) r35 = 6 - r35.
IF (NOT MISSING(r36)) r36 = 6 - r36.
IF (NOT MISSING(r37)) r37 = 6 - r37.
IF (NOT MISSING(r38)) r38 = 6 - r38.
EXECUTE.

* --- Subscale means (naive: mean of available items; adjust missing rule as needed).
COMPUTE gcls_Psychological_Functioning = MEAN.10(r01,r02,r04,r06,r07,r08,r09,r11,r12,r13).
COMPUTE gcls_Genitalia = MEAN.6(r14,r21,r25,r26,r27,r29).
COMPUTE gcls_Social_Gender_Role_Recognition = MEAN.4(r16,r19,r20,r22).
COMPUTE gcls_Physical_and_Emotional_Intimacy = MEAN.4(r03,r05,r32,r33).
COMPUTE gcls_Chest = MEAN.4(r15,r18,r28,r30).
COMPUTE gcls_Other_Secondary_Sex_Characteristics = MEAN.3(r17,r23,r24).
COMPUTE gcls_Life_Satisfaction = MEAN.7(r10,r31,r34,r35,r36,r37,r38).

* Optional clusters and total mean.
COMPUTE gcls_Gender_Congruence = MEAN(r14 TO r30).
COMPUTE gcls_Mental_Wellbeing_and_Life_Satisfaction = MEAN(r01 TO r13, r31 TO r38).
COMPUTE gcls_TotalMean = MEAN(r01 TO r38).
EXECUTE.

