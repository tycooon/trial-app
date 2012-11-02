Joosy.namespace 'Statements', ->

  class @ReportPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'index'

    elements:
      "dateInput" : "input.date"
      "timeInput" : "input.time"

    events:
      "click button.update" : "updateStatements"

    @fetch (complete) ->
      Statement.find "all", (statements) =>
        @data =
          statements: statements
          report:     true
        complete()

    updateStatements: ->
      date = "#{@dateInput.val()} #{@timeInput.val()}"
      Statement.find "all", params: { date: date }, (statements) =>
        @$("table tbody").html @render "_statements", statements: statements
