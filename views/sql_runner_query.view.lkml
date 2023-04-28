view: sql_runner_query {
  derived_table: {
    sql: SELECT
          asset_management_investor,
          asset_management_stock_name,
          asset_management_total_initial_investment_value,
          asset_management_total_current_investment_value,
          asset_management_total_fund_change,
          asset_management_total_volume
      FROM
          (SELECT
                  asset_management.Investor  AS asset_management_investor,
                  asset_management.Stock_Name  AS asset_management_stock_name,
                  COALESCE(SUM(asset_management.Initial_Investment_Value ), 0) AS asset_management_total_initial_investment_value,
                  COALESCE(SUM(asset_management.Current_Investment_Value ), 0) AS asset_management_total_current_investment_value,
                  COALESCE(SUM(asset_management.Fund_Change______ ), 0) AS asset_management_total_fund_change,
                  COALESCE(SUM(asset_management.Volume ), 0) AS asset_management_total_volume,
                  COALESCE(SUM(asset_management.Volume ), 0) AS asset_management_total_volume_0
              FROM `csilvariverademo.asset_manager.asset_management`
           AS asset_management
              GROUP BY
                  1,
                  2
              HAVING asset_management_total_volume_0 <> 0) AS t2
      ORDER BY
          5 DESC
      LIMIT 10
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: asset_management_investor {
    type: string
    sql: ${TABLE}.asset_management_investor ;;
  }

  dimension: asset_management_stock_name {
    type: string
    sql: ${TABLE}.asset_management_stock_name ;;
  }

  dimension: asset_management_total_initial_investment_value {
    type: number
    sql: ${TABLE}.asset_management_total_initial_investment_value ;;
  }

  dimension: asset_management_total_current_investment_value {
    type: number
    sql: ${TABLE}.asset_management_total_current_investment_value ;;
  }

  dimension: asset_management_total_fund_change {
    type: number
    sql: ${TABLE}.asset_management_total_fund_change ;;
  }

  dimension: asset_management_total_volume {
    type: number
    sql: ${TABLE}.asset_management_total_volume ;;
  }

  set: detail {
    fields: [
      asset_management_investor,
      asset_management_stock_name,
      asset_management_total_initial_investment_value,
      asset_management_total_current_investment_value,
      asset_management_total_fund_change,
      asset_management_total_volume
    ]
  }
}
