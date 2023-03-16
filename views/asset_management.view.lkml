# The name of this view in Looker is "Asset Management"
view: asset_management {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `csilvariverademo.asset_manager.asset_management`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called " Change" in Explore.

  dimension: __change {
    hidden: yes
    type: number
    sql: ${TABLE}.__change ;;
  }

  measure: fund_changes {
    label: "Fund Change (%)"
    type: average
    value_format_name: percent_2
    sql: ${__change} *100 ;;
  }

  measure: change {
    label: "Stock Change (%)"
    type: average
    value_format_name: percent_2
    sql: ${__change} ;;
  }

  dimension: asset_value {
    hidden: yes
    type: number
    sql: ${TABLE}.Asset_Value ;;
  }

  measure: total_asset_value {
    label: "total_asset_value ($)"
    type: sum
    value_format_name: usd
    sql: ${asset_value} ;;

  }

  dimension: change_above_target {
    hidden: yes
    type: yesno
    sql: ${TABLE}.Change_Above_Target ;;
  }

  dimension: change_since_start__share_price_ {
    hidden: yes
    type: number
    sql: ${TABLE}.Change_since_start__share_price_ ;;
  }


  measure: total_change_since_start__share_price_ {
    label: "Total price change since start ($) "
    type: sum
    value_format_name: usd
    sql: ${change_since_start__share_price_} ;;
  }

  measure: average_change_since_start__share_price_ {
    label: "Total price change since start (%)"
    type: average
    sql: ${change_since_start__share_price_} ;;
  }

  dimension: close____ {
    hidden: yes
    type: number
    sql: ${TABLE}.Close____ ;;
  }

  dimension: close_to_open {
    hidden: yes
    type: number
    sql: ${TABLE}.Close_to_Open ;;
  }

  measure: total_close_to_open  {
    label: "Total close to open"
    type: sum
    value_format_name: usd
    sql: ${close_to_open} ;;
  }

  dimension: current_investment_value {
    hidden: yes
    type: number
    sql: ${TABLE}.Current_Investment_Value ;;
  }

  measure: total_current_investment_value {
    label: "Current Investment Value"
    type: sum
    value_format_name: usd
    sql: ${current_investment_value} ;;
    drill_fields: [detail*]

  }

  dimension: daily_change {
    hidden: yes
    type: number
    sql: ${TABLE}.Daily_Change ;;
  }

  measure: total_daily_change{
    label: "Daily Change ($)"
    type: sum
    value_format_name: usd
    sql: ${daily_change} ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension_group: date__copy_ {
    hidden: yes
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date__copy_ ;;
  }

  dimension: equity {
    type: number
    sql: ${TABLE}.Equity ;;
  }

  dimension: fund_change {
    hidden: yes
    type: number
    sql: ${TABLE}.Fund_Change ;;
  }

  dimension: fund_change__ {
    hidden: yes
    type: number
    sql: ${TABLE}.Fund_Change__ ;;
  }

  measure: total_fund_change {
    label: "Fund change ($)"
    type: sum
    value_format_name: usd
    sql:${fund_change______}  ;;
  }

  dimension: fund_change______ {
    hidden: no
    type: number
    sql: ${TABLE}.Fund_Change______ ;;
  }

  dimension: fund_value {
    hidden: yes
    type: number
    sql: ${TABLE}.Fund_Value ;;
  }

  measure: total_fund_value {
    label: "Fund Value"
    type: sum
    value_format_name: usd
    sql: ${fund_value} ;;
  }

  dimension: growth_ {
    hidden: yes
    label: "Growth?"
    type: yesno
    sql: ${TABLE}.Growth_ ;;
  }

  dimension: high {
    type: number
    sql: ${TABLE}.High ;;
  }

  dimension: high_to_low {
    type: number
    sql: ${TABLE}.High_to_Low ;;
  }

  dimension: imaginary_phone__ {
    label: "Company Phone"
    type: number
    sql: ${TABLE}.Imaginary_Phone__ ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.Industry ;;
  }


  dimension: initial_date_onwards {
    hidden: yes
    type: yesno
    sql: ${TABLE}.Initial_Date_Onwards ;;
  }

  dimension: initial_investment_value {
    hidden: yes
    type: number
    value_format_name: usd
    sql: ${TABLE}.Initial_Investment_Value ;;
  }


  measure: total_initial_investment_value {
    label: "Initial investment value"
    type: sum
    value_format_name: usd
    sql: ${initial_investment_value} ;;
  }

  dimension: initial_stock_share_price {
    hidden: yes
    type: number
    sql: ${TABLE}.Initial_Stock_Share_Price ;;
  }

  measure: total_initial_stock_share_price {
    label: "Initial Stock Share Price "
    type: sum
    value_format_name: usd
    sql: ${initial_stock_share_price} ;;

  }

  dimension_group: invest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Invest_Date ;;
  }

  dimension: invest_date_close_price {
    hidden: yes
    type: number
    sql: ${TABLE}.Invest_Date_Close_Price ;;
  }

  measure: total_close {
    label: "Close value on day"
    type: sum
    value_format_name: usd
    sql: ${close____} ;;
  }

  measure: max_close {
    label: "Max Close value"
    type: max
    value_format_name: usd
    sql: ${close____} ;;
  }

  measure: min_close {
    label: "Min Close value"
    type: min
    value_format_name: usd
    sql: ${close____} ;;
  }

  dimension: investor {
    type: string
    sql: ${TABLE}.Investor ;;
    action: {
      label: " Email Investor"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "{{ stock_name }} Is on the rise"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Dear {{value}},

        We appreciate your continue loyalty and we have identified that one of your instruments is performing particularly
        well. Please make sure to contact us to discuss how to take this investment to the next level

        Your friends at Cymbal Investments"
      }
    }
  }

  dimension: investor__group_ {
    type: string
    sql: ${TABLE}.Investor__group_ ;;
  }

  dimension: last_6_months {
    hidden: yes
    type: yesno
    sql: ${TABLE}.Last_6_Months ;;
  }

  dimension: latest_date {
    hidden: yes
    type: string
    sql: ${TABLE}.Latest_Date ;;
  }

  dimension: low {
    type: number
    sql: ${TABLE}.Low ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.Market ;;
    drill_fields: [stock_ticker__profiles_]
  }

  dimension: mkt_cap__m_ {
    type: number
    sql: ${TABLE}.Mkt_Cap__m_ ;;
  }

  dimension: number_of_records {
    hidden: yes
    type: number
    sql: ${TABLE}.Number_of_Records ;;
  }

  dimension: open {
    hidden: yes
    type: number
    sql: ${TABLE}.Open ;;
  }

  measure: max_open {
    label: "Open value on day"
    type: max
    value_format_name: usd
    sql: ${open} ;;

  }

  dimension: open_to_close {
    hidden: yes
    type: number
    sql: ${TABLE}.Open_to_Close ;;
  }

  dimension: postive_days {
    hidden: yes
    type: number
    sql: ${TABLE}.Postive_Days ;;
  }

  measure: total_positive_days {
    label: "Days with positive change"
    type: sum
    sql: ${postive_days} ;;

  }

  dimension: sector {
    type: string
    sql: ${TABLE}.Sector ;;
    drill_fields: [industry]
  }

  dimension: stock_name {
    type: string
    sql: ${TABLE}.Stock_Name ;;
    link: {
      label: "Search"
      url: "http://www.google.com/search?q={{ value | encode_uri }}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.google.com"
    }
    link: {
      label: "{{value}} Detail Dashboard"
      url: "/dashboards/83?Date%20Date=2017%2F02%2F10%20to%202017%2F08%2F10&Stock%20Name={{ value | encode_uri }}"
      icon_url: "https://www.seekpng.com/png/full/138-1386046_google-analytics-integration-analytics-icon-blue-png.png"
    }
  }

  dimension: stock_ticker__profiles_ {
    type: string
    sql: ${TABLE}.Stock_Ticker__Profiles_ ;;
  }

  dimension: volume {
    hidden: yes
    type: number
    sql: ${TABLE}.Volume ;;
  }

  measure: total_volume {
    label: "Volume"
    type: sum
    sql: ${volume} ;;

  }

  measure: last_date {
    type: date
    sql:max(${date_date});;
  }

  measure: count {
    type: count
    drill_fields: [stock_name]
  }

########## Sets ##########

  set: detail {
    fields: [stock_ticker__profiles_, stock_name, investor,sector,industry,total_initial_investment_value,total_current_investment_value,total_close,total_fund_value]
  }
}
