view: carriers {
  sql_table_name: `faa.carriers` ;;
  drill_fields: [code]

  dimension: code {
    primary_key: yes
    type: string
    sql: ${TABLE}.code ;;
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }
  dimension: nickname {
    type: string
    sql: ${TABLE}.nicknaame ;;
  }
  measure: count {
    type: count
    drill_fields: [code, name, nickname]
  }
}
