/* Left Join table annual_div_info and annual on stock_code and div_year */
CREATE TABLE half_summ as
SELECT annual_div_info."div_stock_code", annual_div_info."div_year", annual_div_info."div_status", 
annual_div_info."dividend_y_%", annual_div_info."div_dividend(RM)", annual."annual_eps", annual."annual_dp(%)"
FROM annual_div_info LEFT JOIN annual ON (annual_div_info."div_stock_code" = annual."annual_stock_code" AND annual_div_info."div_year" = annual."div_year")
ORDER BY annual_div_info."div_stock_code", annual_div_info."div_year"


/*Left join table half_summ and stock_performance on stock_code and year*/
CREATE TABLE final_summ as
SELECT half_summ."div_stock_code" AS "Stock Code", half_summ."div_year" AS "Year", half_summ."div_status" AS "Dividend Status", 
half_summ."dividend_y_%" AS "Dividend Yield(%)", half_summ."div_dividend(RM)" AS "Dividend(RM)", half_summ."annual_eps" AS "Earning per Share(EPS)", (half_summ."annual_dp(%)")*100 AS "DPR(%)", stock_performance."quar_roe(%)" AS "ROE(%)"
FROM half_summ LEFT JOIN stock_performance ON (half_summ."div_stock_code" = stock_performance."quar_stock_code" AND half_summ."div_year" = stock_performance."quar_year")
ORDER BY half_summ."div_stock_code", half_summ."div_year"