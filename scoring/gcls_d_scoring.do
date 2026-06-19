* GCLS-D Scoring (Stata).
* Erwartet Items als gcls_01 bis gcls_38 (Werte 1-5).
* Reverse-Items: 3, 5, 10, 31-38, 32, 33, 34, 35, 36, 37, 38.
* Reverse (1-5): x_rev = 6 - x.

* Copy items to r01..r38 (so original stays intact)
forvalues i = 1/38 {
    local v = string(`i', "%02.0f")
    gen double r`v' = gcls_`v'
}

* Reverse items
foreach i in 03 05 10 31 32 33 34 35 36 37 38 {
    replace r`i' = 6 - r`i' if !missing(r`i')
}

* Subscale means (naive: mean over available items; set missing rule to taste)
egen gcls_Psychological_Functioning = rowmean(r01 r02 r04 r06 r07 r08 r09 r11 r12 r13)
egen gcls_Genitalia = rowmean(r14 r21 r25 r26 r27 r29)
egen gcls_Social_Gender_Role_Recognition = rowmean(r16 r19 r20 r22)
egen gcls_Physical_and_Emotional_Intimacy = rowmean(r03 r05 r32 r33)
egen gcls_Chest = rowmean(r15 r18 r28 r30)
egen gcls_Other_Secondary_Sex_Characteristics = rowmean(r17 r23 r24)
egen gcls_Life_Satisfaction = rowmean(r10 r31 r34 r35 r36 r37 r38)

* Optional clusters and total mean
egen gcls_Gender_Congruence = rowmean(r14-r30)
egen gcls_Mental_Wellbeing_and_Life_Satisfaction = rowmean(r01-r13 r31-r38)
egen gcls_TotalMean = rowmean(r01-r38)

