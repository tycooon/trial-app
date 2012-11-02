Joosy.namespace 'Statements', ->

  class @ReportPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'index'

    elements:
      "dateInput" : "input[name=date]"

    events:
      "click button.update" : "updateStatements"

    @fetch (complete) ->
      Statement.find "all", (statements) =>
        @data =
          statements: statements
          report:     true
        complete()

    @afterLoad ->
      @dateInput.datepicker
        dateFormat: "dd.mm.yy"

    updateStatements: ->
      Statement.find "all", params: { date: @dateInput.val() }, (statements) =>
        @$("table tbody").html @render "_statements", statements: statements
