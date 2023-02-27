/* Create a table, 'train_test_tab' that contains data from Year 2018 to 2021, which is used to split the data into training and test data */
CREATE TABLE train_test_tab AS
SELECT *
FROM sum_final
WHERE NOT ("sum_year" = 2022 OR "sum_year" = 2023)
ORDER BY "sum_stockCode", sum_year;

/* Create a table, 'pred_tab' that is used to predict the model where it only contains data from Year 2022 to current */
CREATE TABLE pred_tab AS
SELECT *
FROM sum_final
WHERE "sum_year" = 2022 OR "sum_year" = 2023
ORDER BY "sum_stockCode", sum_year;

