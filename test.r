# R code to read in the CSV file "newdata.csv" 

newsleepdata <- read.csv("C:/src/lab_test/Lab_Model_Test/newdata.csv", header = T)  # Please change the path accordingly. 

# newsleepdata

# Change categorical variables into factors

newsleepdata$gender <- as.factor(newsleepdata$gender)  
newsleepdata$Status <- as.factor(newsleepdata$Status)  
newsleepdata$osasev <- as.factor(newsleepdata$osasev)  

# Change AHI = 0 to 0.05 to avoid issue for taking log
newsleepdata$ahi[newsleepdata$ahi == 0] <- 0.05 

# Remove highly unusual data points (AHI > 100 and BMI > 70)
newsleepdata <- newsleepdata[newsleepdata$ahi <= 100, ]
newsleepdata <- newsleepdata[-437, ]
# newsleepdata is the data frame being used for the analysis.


# The following variables are considered: 
# • TRT (Total Recording Time): Time from recording start to recording end
# • SPT (Sleep period time): Elapsed time from sleep onset (SO) to last epoch of sleep (LSP)
# • TST (Total sleep time): Time spent on sleeping during sleep period time (SPT)
# • Sleepeff (Sleep efficiency): Ratio of total sleep time (TST) to sleep period time (SPT)
# • Onset (Sleep onset): The duration of time when the subject undergoes a transition from wakefulness into # sleep.
# • WASO (Wakefulness after sleep onset): Awake time (AWT) during sleep onset (SO) to lights on (LO)
# • WK (Percentage of Wake stage): Ratio of total Wake time over total sleep time (TST)
# • N1(Percentage of N1 stage): Ratio of total N1 time (TN1ST) over total sleep time (TST)
# • N2(Percentage of N2 stage): Ratio of total N2 time (TN2ST) over total sleep time (TST)
# • N3 (Percentage of N3 stage): Ratio of total N3 time (TN3ST) over total sleep time (TST)
# • REMper (Percentage of REM stage): Ratio of total REM sleep time (TRST) over total sleep time (TST)
# • REMsleep (REM latency from sleep onset): The duration from sleep onset to the first REM sleep
# • REMlightoff (REM latency from light off): The duration from light off to the first REM sleep

# AHI -> OSA Severity
# Four groups 
# < 5 -> "Normal"
# 5-15 -> "Mild"
# 15-30 -> "Moderate"
# > 30 -> "Severe"

# Two groups 
# < 5 -> "Normal"
# >= 5 >- "Not normal" 