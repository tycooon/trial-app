Joosy.namespace 'Statements', ->

  class @IndexPage extends ApplicationPage
    @layout ApplicationLayout
    @view   'index'

    @fetch (complete) ->
      Statement.find "all", (statements) =>
        @data.statements = statements
        complete()
