--   ======================================================================================
--    AUTOGENERATED!!!! DO NOT EDIT!!!!
--   ======================================================================================

CREATE OR REPLACE VIEW dv.sales_orderline_h
AS
SELECT
  sales_orderline_key
  ,sales_orderline_id
  ,load_dts
  ,rec_src
FROM (
  SELECT
    sales_orderline_key
    ,sales_orderline_id
    ,load_dts
    ,rec_src
    ,row_number() over(PARTITION BY sales_orderline_key ORDER BY load_dts asc) rn
  FROM (
    
    SELECT
      src:SalesOrderDetailID::STRING AS sales_orderline_key
      ,src:SalesOrderDetailID::STRING AS sales_orderline_id
      ,CURRENT_TIMESTAMP AS load_dts
      ,'sales' AS rec_src
    FROM
      src_adventureworks.salesorderdetail
  )
)
WHERE rn = 1
;