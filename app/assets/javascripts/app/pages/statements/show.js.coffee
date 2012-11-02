Joosy.namespace 'Statements', ->

  class @ShowPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'show'

    elements:
      deleteButton: "a.btn.btn-danger"
      rawForm:      "form"

    events:
      "click $deleteButton" : "removeStatement"

    @fetch (complete) ->
      Statement.find @params.id, (statement) =>
        @statement = statement
        @data = {@statement}
        complete()

    @afterLoad ->
      Joosy.Form.attach @rawForm,
        resource: @statement
        success: =>
          @navigate "#!"


    removeStatement: ->
      @statement.delete({})
      @navigate "#!"
