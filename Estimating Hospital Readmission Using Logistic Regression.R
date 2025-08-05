# Simulated patient data
set.seed(123)
patient_data <- data.frame(
  Age = sample(25:80, 100, replace = TRUE),
  ChronicDisease = sample(c(0, 1), 100, replace = TRUE),
  DaysHospitalized = sample(2:15, 100, replace = TRUE),
  Readmitted = sample(c(0, 1), 100, replace = TRUE)  # 1 = Yes, 0 = No
)
summary(patient_data)
table(patient_data$Readmitted)

# Logistic regression model
logit_model <- glm(Readmitted ~ Age + ChronicDisease + DaysHospitalized,
                   data = patient_data, family = binomial)
summary(logit_model)

# Predict probabilities
predicted_probs <- predict(logit_model, type = "response")

# Classify based on threshold
predicted_classes <- ifelse(predicted_probs > 0.5, 1, 0)

# Confusion matrix
table(Predicted = predicted_classes, Actual = patient_data$Readmitted)
