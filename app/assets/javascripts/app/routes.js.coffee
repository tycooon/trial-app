Joosy.Router.map
  '/'               : Statements.IndexPage
  '/report'         : Statements.ReportPage
  '/statements'     :
    '/new'          : Statements.ShowPage
    '/:id'          : Statements.ShowPage

  404             : (path) -> alert "Page '#{path}' was not found :("
# '/resources'    :
#   '/'           : Resource.IndexPage
#   '/:id'        : Resource.ShowPage
#   '/:id/edit'   : Resource.EditPage
#   '/new'        : Resource.EditPage
