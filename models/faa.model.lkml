connection: "bq_faa"

# include all the views
include: "/views/*.view"
include: "/*.dashboard"

datagroup: faa_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: faa_default_datagroup

explore: flights {
  view_name: flights
  view_label: "Flights"

  sql_always_where: ${minutes_flight_length} > 0 and ${minutes_flight_length} < 2000 ;;

  join: origin {
    from: airport
    relationship: many_to_one
    sql_on: ${flights.origin} = ${origin.code} ;;
  }

  join: destination {
    from: airport
    relationship: many_to_one
    sql_on: ${flights.destination} = ${destination.code} ;;
  }

  join: carriers  {
    relationship: many_to_one
    sql_on: ${flights.carrier} = ${carriers.code} ;;
  }



  join: summary_airport {
    view_label: "Flights"
    relationship: many_to_one
    sql_on: ${flights.origin} = ${summary_airport.origin} ;;
  }

}

label: "FAA"
