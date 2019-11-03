class ApplicationController < ActionController::Base
  def hello
    render html: "Hello, world from Azure App Service on Linux!"
    render html: "Luke"
  end
end
