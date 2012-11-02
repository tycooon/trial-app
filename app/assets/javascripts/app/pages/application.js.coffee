class @ApplicationPage extends Joosy.Page
  @afterLoad ->
    $("input.date").datepicker
      dateFormat: "dd.mm.yy"
