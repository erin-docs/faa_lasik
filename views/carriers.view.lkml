view: carriers {
  sql_table_name: `faa.carriers`
    ;;


  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nickname {
    description: "a nickname for the field"
    type: string
    sql: ${TABLE}.nickname ;;
  }

  measure: count {
    type: count
    drill_fields: [name, nickname]
  }
}
