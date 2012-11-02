class AppController < ApplicationController
  helper 'joosy/sprockets'

  def index
    render nothing: true, layout: 'app'
  end
end
