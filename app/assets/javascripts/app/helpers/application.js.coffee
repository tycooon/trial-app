Joosy.helpers 'Application', ->
  @linkTo = (name, url, options = {}) ->
    options.href = "#!/#{url}"
    @tag "a", options, name

  # @helloWorld = (name) ->
  #   "Hello World, #{name}"
